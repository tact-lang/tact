contract TestReturnProper {
    fun getValue(): Int {
        return 123;
    }
    
    receive() {
        dump(self.getValue());
    }
}
