fun add(a: Int, b: Int): Int { return a + b; }

contract TestFunctionCall {
    receive() {
        let result: Int = add(2, 3); // expected: 5
    }
}
