fun add(x: Int, y: Int): Int { return x + y; }

contract TestFunctionCall {
    receive() {
        // Testing function call with inline arguments
        let result: Int = add(5, 10);
        dump(result); // Expected to dump 15
    }
}
