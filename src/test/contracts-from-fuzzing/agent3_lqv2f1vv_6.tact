fun f(a: Int,): Int {
    return a;
}

contract Tester {
    receive() {
        f(5);
    }
}
