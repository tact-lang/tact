asm fun myDepth(): Int { DEPTH }

contract TestAsmFunction {
    receive() {
        // Call the assembly function
        let d: Int = myDepth();
        // There's no exact expected value from DEPTH, but it should be a non-negative integer
        if (d < 0) {
            throw(1);
        }
    }
}
