asm fun addAssembly(a: Int, b: Int): Int { ADD }

contract AsmTest {
    receive() {
        // Expected: 42, because 40 + 2 = 42
        dump(addAssembly(40, 2));
    }
}
