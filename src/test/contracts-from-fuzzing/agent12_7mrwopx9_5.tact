contract TestBool {
    fun test() {
        // Testing boolean literals and logical operators
        let a = true;
        let b = false;
        let c = a || b; // Expected: true
        dump(c);
    }

    receive() {
        self.test();
    }
}
