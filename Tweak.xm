#import <UIKit/UIKit.h>
#import <substrate.h>

// Offsets Atualizados
long aimRotationOffset = 0x2ec;
long weaponRecoilOffset = 0xc;
long headBoneID = 0x33c;

// Funções de Update (Aimbot/Headshot)
void (*old_Update)(void *instance);
void h_Update(void *instance) {
    if (instance != NULL) {
        // Aplica o bone da cabeça no offset
        *(int *)((uintptr_t)instance + aimRotationOffset) = headBoneID;
    }
    old_Update(instance);
}

// Função de Recoil
float (*old_Recoil)(void *instance);
float h_Recoil(void *instance) {
    return 0.0f; // Zero recoil
}

// Onde a mágica acontece (Injeção)
%ctor {
    NSLog(@"SKY+ VIP: SISTEMA INJETADO");

    // Aqui o robô liga as funções dentro do jogo
    MSHookFunction((void *)((uintptr_t)_dyld_get_image_header(0) + aimRotationOffset), (void *)h_Update, (void **)&old_Update);
    MSHookFunction((void *)((uintptr_t)_dyld_get_image_header(0) + weaponRecoilOffset), (void *)h_Recoil, (void **)&old_Recoil);
}
