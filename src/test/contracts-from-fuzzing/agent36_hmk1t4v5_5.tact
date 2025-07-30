contract Test {
    // State variable v with initial value 0
    v: Int = 0;

    receive() {
        try {
            self.v = 100;
            throw(1);
        } catch (e) {
            // In case of error, self.v should rollback to the original value (0).
            dump(self.v);
        }
    }
}