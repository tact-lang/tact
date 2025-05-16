contract TestEmptyBlockInFunction {
    receive() {
        {}
        dump(1);
    }
}
