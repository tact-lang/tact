struct One { number: Int; }

contract TestStructConversion {
    fun test() {
        // Instantiate a struct One
        let o: One = One{ number: 123 };
        // Convert struct to cell and back
        let cell = o.toCell();
        let o2 = One.fromCell(cell);
        // Check if conversion is correct
        if (o2.number != 123) {
            // this require should fail the transaction if conversion is wrong
            require(false, "Struct conversion failed");
        }
        dump(o2.number);
    }

    // Dummy receive function to force contract inclusion
    receive() { cashback(sender()); }
}
