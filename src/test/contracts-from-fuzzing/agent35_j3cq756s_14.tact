contract FunctionCallChaining {
    fun getNumber() : Int {
        return 123;
    }
    
    receive() {
        let str = self.getNumber().toString();
        let chained = str.asComment();
    }
}
