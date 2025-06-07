contract TestTry {
    receive() {
        try {
            throw(101);
        } catch (e) {
            dump(e);
        }
    }
}
