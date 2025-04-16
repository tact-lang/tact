fun id(a: Int): Int { return a; }

contract TestInlineCall {
    receive() {
        // Test inline function call
        let res: Int = id(15);
    }
}
