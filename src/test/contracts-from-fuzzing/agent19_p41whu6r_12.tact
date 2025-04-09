contract TestBooleanLiterals() {
    fun test() {
        dump(true);
        dump(false);
    }
    
    receive() {
        self.test();
    }
}
