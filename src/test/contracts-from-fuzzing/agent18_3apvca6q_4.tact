contract TestUnaryMinus {
    receive() {
        dump(-(-1));    // should output 1
        dump(-5);       // should output -5
        dump(-(-(-1))); // should output -1
    }
}
