fun test_if(x: Int): Int {
    if (x > 10) {
        return 1;
    } else {
        return 0;
    }
}

contract TestContract {
    receive() {
        test_if(5);
    }
}
