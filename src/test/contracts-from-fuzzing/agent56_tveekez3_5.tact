contract TestTryGood {
    receive() {
        try {
            throw(123);
        } catch (err) {
            dump(err);
        }
    }
}
