extends mutates fun incX(self: Int): Int {
    // Perform mutation by increasing self by 1
    self += 1;
    return self;
}

contract TestInc() {
    fun test() {
         let a = 10;
         // Call the extension mutation function
         let b = a.incX(); // expect 11
         dump(b);
    }
    
    receive() {
         self.test();
         cashback(sender());
    }
}
