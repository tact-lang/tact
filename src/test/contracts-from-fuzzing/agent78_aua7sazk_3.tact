contract TestBool {
    receive() {
        if (true) {
            dump(true);
        } else {
            dump(false);
        }
    }
}
