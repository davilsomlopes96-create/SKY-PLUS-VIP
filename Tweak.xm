#import <UIKit/UIKit.h>

long aimRotationOffset = 0x2ec; 
long weaponRecoilOffset = 0xc;
long headBoneID = 0x33c;

void (*old_Update)(void *instance);
void h_Update(void *instance) {
    if (instance != NULL) {
        *(int *)((uintptr_t)instance + aimRotationOffset) = headBoneID;
    }
    old_Update(instance);
}

float (*old_Recoil)(void *instance);
float h_Recoil(void *instance) {
    return 0.0f; 
}

%ctor {
    NSLog(@"SKY+ VIP: SISTEMA INJETADO");
}
