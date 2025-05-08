contract TestContract {
    receive() {
        if (true) {
            dump(42);
        }
    }
}
