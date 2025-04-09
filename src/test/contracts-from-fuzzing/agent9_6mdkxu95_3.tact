contract TestContract {
    // default receiver
    receive() {
        // doing nothing
    }

    // receiver for debug test
    receive("debug") {
        dump(42);
    }
}
