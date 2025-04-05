contract TestTryCatchValid {
    receive() {
        try {
            throw(100);
        } catch (err) {
            dump(err); // should dump 100
        }
    }
}
