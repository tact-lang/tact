contract TestOptionalsValid() {
    fun test() {
         // Valid usage: an optional Int initialized as null then assigned a value
         let x: Int? = null;
         x = 123;
         dump(x!!); // should dump 123
    }
    
    receive() {
         self.test();
         cashback(sender());
    }
}
