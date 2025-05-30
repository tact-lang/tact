contract TestBooleans() {
    fun run() {
         let b: Bool = true && false; // expected false
         dump(b);
         let c: Bool = !(false);
         dump(c); // expected true
    }
    receive() {
         self.run();
    }
}
