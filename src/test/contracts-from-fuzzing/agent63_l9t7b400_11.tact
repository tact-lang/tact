contract TestTryCatch {
    fun test() {
        try {
            throw(42);
        } catch (err) {
            dump(err);
        }
    }
    
    receive() {
        self.test();
    }
}
