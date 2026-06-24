asm fun testAsm(): Int { 42 INT }

contract TestAsmFunction {
    receive() {
        dump(testAsm()); // Expected output: 42
    }
}
