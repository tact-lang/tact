contract TestBool() {
    fun test() {
        let b: Bool = true && false;
        dump(b); // expected output: false
    }
    
    receive() {
        self.test();
    }
}
