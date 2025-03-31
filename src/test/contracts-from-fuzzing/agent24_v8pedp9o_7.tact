contract TestTryCatch {
    fun test() {
        try {
            throw(1042);
        } catch (err) {
            dump(err);
        }
    }

    receive() {
        self.test();
        return;
    }
}
