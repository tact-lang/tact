contract TestOptionalsValid {
    fun test() {
       let opt: Int? = null;
       opt = 42;
       dump(opt!!); // Expected output: 42
    }
    
    receive() {
       self.test();
    }
}
