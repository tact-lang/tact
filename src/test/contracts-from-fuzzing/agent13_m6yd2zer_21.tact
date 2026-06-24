asm fun add(a: Int, b: Int): Int { ADD }

contract TestAsm {
    receive() {
        let result: Int = add(10, 32);
        dump(result); // expected output: 42
    }
}
