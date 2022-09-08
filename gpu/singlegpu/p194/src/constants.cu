#include "api.h"

__constant__ limb_t __p[NWORDS_FIELD] = { 0xFFFFFFFFFFFFFFFF, 0xF1A4E6CD3FFFFFFF, 0x85BD88797CF1E74B, 0x0000000000000003 };
__constant__ limb_t __mu[NWORDS_FIELD] = { 0x0000000000000001, 0xF1A4E6CD40000000, 0x15BD88797CF1E74B, 0xF7B00A8A798F7393 };
__constant__ limb_t mont_one[NWORDS_FIELD] = { 0x48AD5F8A556FD6F1, 0xF1946546C0000000, 0x5BCEED89808368FA, 0x0000000000000002 };
__constant__ limb_t mont_minus_one[NWORDS_FIELD] = { 0xB752A075AA90290E, 0x001081867FFFFFFF, 0x29EE9AEFFC6E7E51, 0x0000000000000001 };
__constant__ limb_t bigone[NWORDS_FIELD] = { 0x0000000000000001, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000 };

__device__ limb_t P_MINUS_TWO[NWORDS_FIELD] = { 0xFFFFFFFFFFFFFFFD, 0xF1A4E6CD3FFFFFFF, 0x85BD88797CF1E74B, 0x0000000000000003 };
__device__ limb_t P_MINUS_THREE_QUARTERS[NWORDS_FIELD] = { 0xFFFFFFFFFFFFFFFF, 0xFC6939B34FFFFFFF, 0xE16F621E5F3C79D2 };
__device__ limb_t P_MINUS_ONE_HALVES[NWORDS_FIELD] = { 0xFFFFFFFFFFFFFFFF, 0xF8D273669FFFFFFF, 0xC2DEC43CBE78F3A5, 0x0000000000000001 };

__device__ limb_t BOUND2[NWORDS_FIELD] = { 0x0000000000000000, 0x0000000020000000, 0x0000000000000000, 0x0000000000000000 };
__constant__ limb_t BOUND2_0[NWORDS_FIELD] = { 0x0000200000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000 };
__constant__ limb_t BOUND2_1[NWORDS_FIELD] = { 0x0000200000000000, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000 };

__device__ limb_t BOUND3[NWORDS_FIELD] = { 0x4FE184719E8AE269, 0x000000000F38208C, 0x0000000000000000, 0x0000000000000000 };
__device__ limb_t BOUND3_0[NWORDS_FIELD] = { 0x00003E6B41437D93, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000 };
__device__ limb_t BOUND3_1[NWORDS_FIELD] = { 0x000014CE6B167F31, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000 };

const limb_t h_mont_one[NWORDS_FIELD] = { 0x48AD5F8A556FD6F1, 0xF1946546C0000000, 0x5BCEED89808368FA, 0x0000000000000002 };

__device__ limb_t STRATEGY2[93] = { 38, 24, 15, 8, 4, 2, 1, 1, 1, 2, 1, 1, 4, 2, 1, 1, 2, 1, 1, 7, 4, 2, 1, 1, 2, 1, 1, 3, 2, 1, 1, 1, 1, 10, 6, 4, 2, 1, 1, 2, 1, 1, 2, 2, 1, 1, 1, 4, 2, 2, 1, 1, 1, 2, 1, 1, 17, 9, 5, 3, 2, 1, 1, 1, 1, 2, 1, 1, 1, 4, 2, 1, 1, 1, 2, 1, 1, 8, 4, 2, 1, 1, 1, 2, 1, 1, 4, 2, 1, 1, 2, 1, 1};
__device__ limb_t STRATEGY2_0[46] = { 21, 12, 6, 4, 2, 1, 1, 2, 1, 1, 2, 2, 1, 1, 1, 5, 3, 2, 1, 1, 1, 1, 2, 1, 1, 1, 9, 5, 3, 2, 1, 1, 1, 1, 2, 1, 1, 1, 4, 2, 1, 1, 1, 2, 1, 1};
__device__ limb_t STRATEGY2_1[46] = { 21, 12, 6, 4, 2, 1, 1, 2, 1, 1, 2, 2, 1, 1, 1, 5, 3, 2, 1, 1, 1, 1, 2, 1, 1, 1, 9, 5, 3, 2, 1, 1, 1, 1, 2, 1, 1, 1, 4, 2, 1, 1, 1, 2, 1, 1};

__device__ limb_t STRATEGY2_REDUCED_0[45] = { 20, 12, 6, 4, 2, 1, 1, 2, 1, 1, 2, 2, 1, 1, 1, 5, 3, 2, 1, 1, 1, 1, 2, 1, 1, 1, 8, 5, 3, 2, 1, 1, 1, 1, 2, 1, 1, 1, 4, 2, 1, 1, 2, 1, 1};
__device__ limb_t STRATEGY2_REDUCED_1[45] = { 20, 12, 6, 4, 2, 1, 1, 2, 1, 1, 2, 2, 1, 1, 1, 5, 3, 2, 1, 1, 1, 1, 2, 1, 1, 1, 8, 5, 3, 2, 1, 1, 1, 1, 2, 1, 1, 1, 4, 2, 1, 1, 2, 1, 1};

__device__ limb_t STRATEGY2_PC_0[19] = { 8, 5, 3, 2, 1, 1, 1, 1, 2, 1, 1, 1, 4, 2, 1, 1, 2, 1, 1};
__device__ limb_t STRATEGY2_PC_1[19] = { 8, 5, 3, 2, 1, 1, 1, 1, 2, 1, 1, 1, 4, 2, 1, 1, 2, 1, 1};

__device__ uint32_t STRATEGY3[58] = { 21, 13, 8, 6, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 3, 2, 1, 1, 1, 1, 1, 5, 3, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 8, 5, 3, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 3, 2, 1, 1, 1, 1, 1};
//const uint32_t STRATEGY3_0[28] = { 10, 6, 5, 3, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 4, 2, 1, 1, 1, 1, 1, 1, 1};
//const uint32_t STRATEGY3_1[29] = { 11, 6, 5, 3, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1};
