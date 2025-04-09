contract TestContract {
    fun getValue(): Int {
        return 42;
    }
    
    receive() {
        dump(self.getValue());
    }
}
