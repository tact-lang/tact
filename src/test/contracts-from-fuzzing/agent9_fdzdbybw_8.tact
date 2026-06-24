contract TestTernary {
    fun test() {
       // Testing ternary operator associativity
       // According to docs:
       // false ? 1 : (false ? 2 : 3) should produce 3
       // false ? 1 : true ? 2 : 3 should produce 2
       let a = false ? 1 : (false ? 2 : 3);
       let b = false ? 1 : true ? 2 : 3;
       dump(a); // Expected output: 3
       dump(b); // Expected output: 2
    }
    
    receive() {
       self.test();
    }
}
