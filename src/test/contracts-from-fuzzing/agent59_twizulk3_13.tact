contract TestOptionalFixed {
    fun test(x: Int?): Int {
       if (x == null) {
           return 0;
       } else {
           return x!!; // using !! operator per docs
       }
    }
    
    receive() {
        dump(self.test(null));
        dump(self.test(42));
    }
}
