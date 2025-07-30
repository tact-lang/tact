contract TestTypes {
    fun test() {
       // Test primitive types
       let a: Int = 1 + 2;  // expected 3
       let b: Bool = true && false; // expected false
       dump(a);
       dump(b);
    }
    receive() {
       self.test();
    }
}
