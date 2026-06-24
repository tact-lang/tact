/// Test case for Structs: converting struct to cell and back
struct One { number: Int; }

contract TestStructs() {
    fun run() {
         // Instantiate struct One with a value
         let s: One = One{ number: 50 };
         dump(s.number); // Expected output: 50
         
         // Convert struct to cell and back
         let cellRepresentation: Cell = s.toCell();
         let s2: One = One.fromCell(cellRepresentation);
         dump(s2.number); // Expected output: 50
    }
    receive() {
         self.run();
    }
}
