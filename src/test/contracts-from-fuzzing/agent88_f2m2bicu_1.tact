contract TestIf {
    receive() {
        if (1 == 1) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
