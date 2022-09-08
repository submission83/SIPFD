#include "api.h"

/* +++ Fixed instance for p82 +++ */

#if RADIX == 64

__device__ proj_t const_E[2] = {{{{0x6cd3eeb664c2da97,0x1be86},{0x0,0x0}},{{0x99d787b32616d4b,0x23046},{0x0,0x0}}},{{{0xde8c8868a5cc1634,0x2266e},{0x7d07a310e2db9319,0x267df}},{{0x53e8851bcf6dd345,0x5d1f},{0x8159de630b3accd9,0x2934c}}}};
__device__ proj_t const_A2[2] = {{{{0x6cd3eeb664c2da97,0x1be86},{0x0,0x0}},{{0x99d787b32616d4b,0x23046},{0x0,0x0}}},{{{0xde8c8868a5cc1634,0x2266e},{0x7d07a310e2db9319,0x267df}},{{0x53e8851bcf6dd345,0x5d1f},{0x8159de630b3accd9,0x2934c}}}};
__device__ proj_t const_BASIS[2][3] = {{{{{0x6182556d1e5e223b,0xa714},{0x0,0x0}},{{0x1d19271c4403ad78,0xb7b4},{0x0,0x0}}},{{{0x642cf8dec393168b,0x17471},{0x0,0x0}},{{0x406429bccaf40d2d,0x5116},{0x0,0x0}}},{{{0x32477c91100d27cf,0x15afa},{0x4805afc813ae8c1e,0x9e79}},{{0xd9e5511dba38f97b,0x617a},{0x224c1313f3125a55,0x85b1}}}},{{{{0xa9dd58b688ba852b,0xca54},{0xa4dab801d8145e5c,0x21cd5}},{{0x281540909268bb23,0x843d},{0x92bd2ca664ce1fb5,0x22a8e}}},{{{0x68af1aa20baff88d,0x142de},{0xb36595b5bd2fb54a,0x25034}},{{0xca8cff2a5197da4e,0x28950},{0x874d0c229ea7f5d2,0x29e86}}},{{{0xdeb341a5b78a256d,0x275a3},{0x2fff787590895a60,0x9e3d}},{{0x72f79ec17ca22abb,0x25db9},{0x3b227c06899c9599,0x25672}}}}};

#elif RADIX == 32
// arith
#else
#error "not implemented"
#endif

const proj_t h_E[2] = {{{{0x6cd3eeb664c2da97,0x1be86},{0x0,0x0}},{{0x99d787b32616d4b,0x23046},{0x0,0x0}}},{{{0xde8c8868a5cc1634,0x2266e},{0x7d07a310e2db9319,0x267df}},{{0x53e8851bcf6dd345,0x5d1f},{0x8159de630b3accd9,0x2934c}}}};
const proj_t h_A2[2] = {{{{0x6cd3eeb664c2da97,0x1be86},{0x0,0x0}},{{0x99d787b32616d4b,0x23046},{0x0,0x0}}},{{{0xde8c8868a5cc1634,0x2266e},{0x7d07a310e2db9319,0x267df}},{{0x53e8851bcf6dd345,0x5d1f},{0x8159de630b3accd9,0x2934c}}}};
const proj_t h_BASIS[2][3] = {{{{{0x6182556d1e5e223b,0xa714},{0x0,0x0}},{{0x1d19271c4403ad78,0xb7b4},{0x0,0x0}}},{{{0x642cf8dec393168b,0x17471},{0x0,0x0}},{{0x406429bccaf40d2d,0x5116},{0x0,0x0}}},{{{0x32477c91100d27cf,0x15afa},{0x4805afc813ae8c1e,0x9e79}},{{0xd9e5511dba38f97b,0x617a},{0x224c1313f3125a55,0x85b1}}}},{{{{0xa9dd58b688ba852b,0xca54},{0xa4dab801d8145e5c,0x21cd5}},{{0x281540909268bb23,0x843d},{0x92bd2ca664ce1fb5,0x22a8e}}},{{{0x68af1aa20baff88d,0x142de},{0xb36595b5bd2fb54a,0x25034}},{{0xca8cff2a5197da4e,0x28950},{0x874d0c229ea7f5d2,0x29e86}}},{{{0xdeb341a5b78a256d,0x275a3},{0x2fff787590895a60,0x9e3d}},{{0x72f79ec17ca22abb,0x25db9},{0x3b227c06899c9599,0x25672}}}}};

//##############################
    //#THE SECRET COLLISION IS:
    	//# c0 = 0;
    	//# k0 = 141056
    	//# c1 = 1;
    	//# k1 = 108253
    //# THE KERNEL POINTS ARE
    	//#K0_x = 0x00000000000291ff772054e42cc97c20 + i * 0x000000000001b500420ca9fbd39b4122;
    	//#K1_x = 0x000000000001ac2825f412531177198b + i * 0x000000000001fa464048899f9c48c799;
//# Dont tell anyone!
//##############################