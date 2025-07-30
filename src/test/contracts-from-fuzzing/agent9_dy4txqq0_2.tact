fun test(a: Int,): Int {
    return a;
}

contract Tester {
    receive() {
        test(1);
    }
}
