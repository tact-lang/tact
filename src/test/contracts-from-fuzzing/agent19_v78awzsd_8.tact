/// Test Case 10: Type Conversions and Destructuring
// This contract tests various type conversion extensions and destructuring assignments.
contract TestTypeConversions() {
    fun run() {
        // Test string to slice conversion
        let str: String = "Hello, Tact!";
        // According to docs, String.asSlice() is available as an extension function
        // But if not, we can convert to cell using asComment() and then parse its slice
        let cellFromStr: Cell = str.asComment();
        let sliceFromCell: Slice = cellFromStr.asSlice();
        
        // Test Address conversion
        let addr: Address = myAddress();
        // Address.asSlice() should be available, then reparse using parseStdAddress() to get StdAddress
        let addrSlice: Slice = addr.asSlice();
        let stdAddr = parseStdAddress(addrSlice);
        
        // Test numeric literal variants (with underscores, hex, octal, binary)
        let dec: Int = 1_000_000;
        let hex: Int = 0xFF_AA;
        let oct: Int = 0o7_5_5;
        let bin: Int = 0b1010_1010;
        
        // Destructuring assignment with composite types
        // Let's use StdAddress struct (defined in docs) which contains workchain and address.
        let sAddr: StdAddress = parseStdAddress(myAddress().asSlice());
        let StdAddress{ workchain, address, .. } = sAddr;
        // Now workchain and address hold the values from sAddr
        
        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}
