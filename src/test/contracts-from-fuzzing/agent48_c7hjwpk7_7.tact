contract Test {
    fun retTest(): Int {
        return 42;
    }
    
    receive() {
        dump(self.retTest());
    }
}
