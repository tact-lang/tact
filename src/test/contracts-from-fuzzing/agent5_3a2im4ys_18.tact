fun add(x: Int, y: Int): Int { return x + y; }

contract TestFunctionCall {
    receive() {
         let res: Int = add(10, 20);
    }
}
