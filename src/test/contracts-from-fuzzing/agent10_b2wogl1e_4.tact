contract TestIntegerLiterals() {
    fun run() {
        let dec = 255;
        let hex = 0xFF;
        let oct = 0o377;
        let bin = 0b11111111;
        require(dec == 255, "Decimal literal failed");
        require(hex == 255, "Hexadecimal literal failed");
        require(oct == 255, "Octal literal failed");
        require(bin == 255, "Binary literal failed");
    }
    
    receive() {
        self.run();
    }
}
