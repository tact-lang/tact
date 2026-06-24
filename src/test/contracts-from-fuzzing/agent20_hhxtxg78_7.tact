// Test 4: Assembly function with lowercase TVM instruction, expecting compilation error
// TVM instructions must be in uppercase. Using 'drop' in lowercase should yield an error.
asm fun lowerCaseError(): Int { drop }
