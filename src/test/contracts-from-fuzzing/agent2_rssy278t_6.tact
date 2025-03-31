/// Assembly function test: minimal valid assembly function body
asm fun test_asm(): Int { 42 INT }

// Also include a valid contract to see that assembly functions can be declared at module level
contract AssemblyTest {
    // A function using assembly function call inside a contract
    get fun answer(): Int {
        return test_asm();
    }
}
