fun test_return(x: Int): Int {
    if (x > 0) {
        return x;
    } else {
        return -x;
    }
}

contract TestReturn {
    receive() {
        dump(test_return(5));
    }
}
