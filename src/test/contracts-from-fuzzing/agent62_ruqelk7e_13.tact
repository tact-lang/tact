contract TestEmptyBlock2 {
    receive() {
        if (true) { }
        dump(1);
    }
}
