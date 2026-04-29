#import <UIKit/UIKit.h>
#import <substrate.h>
#import <mach-o/dyld.h>

// Offsets
long aimRotationOffset = 0x2ec;
long weaponRecoilOffset = 0xc;
int headBone = 0x33c;

// Definição do Aimbot
void (*old_Update)(void *instance);
void h_Update(void *instance) {
    if (instance != NULL) {
        *(int *)((uintptr_t)instance + aimRotationOffset) = headBone;
    }
    old_Update(instance);
}

// Definição do Recoil
float (*old_Recoil)(void *instance);
float h_Recoil(void *instance) {
    return 0.0f;
}

// Injeção dos ganchos
static __attribute__((constructor)) void init() {
    uintptr_t base = (uintptr_t)_dyld_get_image_header(0);
    
    MSHookFunction((void *)(base + aimRotationOffset), (void *)h_Update, (void **)&old_Update);
    MSHookFunction((void *)(base + weaponRecoilOffset), (void *)h_Recoil, (void **)&old_Recoil);
}
