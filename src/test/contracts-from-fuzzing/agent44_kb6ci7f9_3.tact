contract TestLiterals {
    receive() {
        // Integer literal
        let a: Int = 42;
        // Boolean literal
        let b: Bool = true;
        // String literal
        let s: String = "Tact";
        // Address literal using the address() constructor as per documentation  
        let addr: Address = address("0:0000000000000000000000000000000000000000000000000000000000000000");
        dump(a);
        dump(b);
        dump(s);
        dump(addr.toString());
    }
}
