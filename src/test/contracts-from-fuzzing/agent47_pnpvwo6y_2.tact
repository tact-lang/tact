contract PrimitiveTest {
    fun run() {
        // Testing valid primitive types
        let a: Int = 10;
        let b: Bool = true;
        let s: String = "hello";
        let c: Cell = emptyCell();
        let addr: Address = myAddress();

        // Some basic operations
        let sum = a + 5;
        // Logical NOT operator: use ! on booleans
        let neg = !b;
        let commentCell = s.asComment();
        
        // Convert address to slice and parse StdAddress
        let slice: Slice = addr.asSlice();
        let std: StdAddress = parseStdAddress(slice);

        // Using built-in dump function (assumed built-in logging)
        dump(sum);
        dump(neg);
        dump(std.workchain);
    }
}
