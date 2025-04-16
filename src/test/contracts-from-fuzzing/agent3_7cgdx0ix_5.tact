contract TestReturn {
    fun test(): Int {
        return 123; // Valid return statement with expression
    }
    receive() {
        dump(self.test());
    }
}
