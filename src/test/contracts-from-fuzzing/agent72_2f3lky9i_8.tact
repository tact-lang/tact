contract Test {
    receive() {
        try {
            dump(1);
        } catch (err) {
            dump(0);
        }
    }
}
