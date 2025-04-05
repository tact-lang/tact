asm fun testAsm(): Int { DEPTH }

contract TestAsm {
    receive() {
        // Calls the assembly function testAsm to obtain the TVM stack depth
        let d: Int = testAsm();
        // For testing purposes, simply discard d
        // Optionally, we could use d in a dummy arithmetic operation:
        let result: Int = d + 0;
    }
}
