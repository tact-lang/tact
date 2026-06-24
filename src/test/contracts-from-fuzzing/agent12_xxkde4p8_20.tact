asm fun addTwo(a: Int, b: Int): Int { ADD }

contract TestAsmFunction {
    receive() {
        let s: Int = addTwo(21, 21);
        dump(s); // Expected to dump 42
    }
}
