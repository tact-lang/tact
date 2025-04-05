contract Main() {
    fun testTypes() {
         let a: Int = 42;
         let b: Bool = true;
         let s: String = "hello";
         let c: Cell = "hello".asComment();
         dump(a);
         dump(b);
         dump(s);
         dump(c);
    }
    
    receive() {
         self.testTypes();
         cashback(sender());
    }
}
