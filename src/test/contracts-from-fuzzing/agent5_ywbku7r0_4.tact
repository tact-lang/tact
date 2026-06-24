contract Test {
    fun getAnswer(): Int {
        return 42;
    }
    
    receive() {
        dump(self.getAnswer());
    }
}
