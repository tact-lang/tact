contract Test {
    fun inner() {
        try {
            throw(77);
        } catch (err) {
            dump(err); // expected output: 77
        }
    }

    fun outer() {
        try {
            self.inner();
            throw(100);
        } catch (err) {
            dump(err); // expected output: 100
        }
    }

    receive() {
        self.outer();
    }
}
