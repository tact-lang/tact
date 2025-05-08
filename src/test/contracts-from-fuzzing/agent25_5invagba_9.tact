fun add(a: Int, b: Int): Int { return a + b; }

contract TestFuncCall {
    receive() {
        let sum: Int = add(10, 32);
        dump(sum);
    }
}
