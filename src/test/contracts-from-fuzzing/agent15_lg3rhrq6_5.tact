contract Test {
    receive() {
        try {
            throw(1042);
        } catch (e) {
            dump(e);
        }
    }
}
