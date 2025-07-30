contract TestTryCatchValid {
    receive() {
        try {
            throw(987);
        } catch (err) {
            dump(err); // should dump 987
        }
    }
}
