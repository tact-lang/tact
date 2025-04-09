contract Test {
    a: Int = ascii("12345678901234567890123456789012");
    
    receive() {
        // Dump the constant computed ascii value
        dump(self.a);
    }
}
