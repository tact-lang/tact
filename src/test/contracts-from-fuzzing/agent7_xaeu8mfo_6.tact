contract TestOptional {
    fun test(opt: Int?) {
        dump(opt);
    }
    
    receive() {
        self.test(123);
        self.test(null);
    }
}
