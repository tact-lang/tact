contract Test {
    fun getVal(): Int {
        return 42;
    }
    
    receive() {
        dump(self.getVal());
    }
}
