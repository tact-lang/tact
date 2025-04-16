contract TestContract {
    receive() {
        do {
            dump(100);
        } until (true);
    }
}
