#import <UIKit/UIKit.h>

// Offsets do Free Fire
long aimRotationOffset = 0x2ec;
long weaponRecoilOffset = 0xc;
int headBone = 0x33c;

// Definição das funções
void (*old_Update)(void *instance);
void h_Update(void *instance) {
    if (instance != NULL) {
        *(int *)((uintptr_t)instance + aimRotationOffset) = headBone;
    }
    old_Update(instance);
}

float (*old_Recoil)(void *instance) {
    return 0.0f;
}

// Injeção manual (mais segura para o robô)
extern "C" void MSHookFunction(void *symbol, void *replace, void **result);

static __attribute__((constructor)) void init() {
    uintptr_t base = (uintptr_t)_dyld_get_image_header(0);
    MSHookFunction((void *)(base + aimRotationOffset), (void *)h_Update, (void **)&old_Update);
}
