/// Test 3: Assembly function with invalid parameter name usage
// Expected: Compilation error: non-existent TVM instruction "BOC" is not recognized
asm fun bocchiThe(BOC: Cell): Cell { BOC }