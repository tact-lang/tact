contract Test {
    fun test() {
        // Testing various integer literal representations
        let dec = 42;              // decimal literal
        let dec2 = 1_000;          // decimal with underscore
        let oct = 020;             // octal literal, note: actual interpretation in Tact?
        let hex = 0xABC;           // hexadecimal literal
        let bin = 0b1010;          // binary literal
        
        // Dump the values to force evaluation
        dump(dec);
        dump(dec2);
        dump(oct);
        dump(hex);
        dump(bin);
    }

    // receive function to ensure test() is compiled and executed
    receive() {
        self.test();
    }
}
