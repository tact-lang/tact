contract Test {
    fun test() {
        // Test different integer literal expressions with underscore separators and various bases
        let dec: Int = 1_000;       // decimal literal with underscores
        let hex: Int = 0xABC;        // hexadecimal literal (2748 in decimal)
        let oct: Int = 0o777;        // octal literal (511 in decimal)
        let bin: Int = 0b1010;       // binary literal (10 in decimal)
        
        // Compute sum: 1000 + 2748 + 511 + 10 = 4269
        dump(dec + hex + oct + bin);
    }
    
    receive() {
        self.test();
    }
}
