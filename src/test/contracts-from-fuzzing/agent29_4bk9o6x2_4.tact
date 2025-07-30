contract TestContract {
    receive() {
        if (false) {
            dump(1);
        } else if (true) {
            dump(2);
        } else {
            dump(3);
        }
    }
}
