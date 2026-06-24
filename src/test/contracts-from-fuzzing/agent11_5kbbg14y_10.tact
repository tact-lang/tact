fun add(x: Int, y: Int): Int {
    return x + y;
}

contract TestFunctionCalls {
    receive() {
        let res1: Int = add(10, 20);
        let res2: Int = add(add(1, 2), add(3, 4));
        dump(res1);
        dump(res2);
    }
}
