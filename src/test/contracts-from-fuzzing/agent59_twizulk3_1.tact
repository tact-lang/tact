contract TestIf {
    receive() {
        if (true) {
            dump(1);
        } else {
            dump(2);
        }
    }
}
