struct One { number: Int; }

contract TestStructExpressions() {
    fun run() {
         // Instantiate a struct with a field
         let s: One = One{ number: 42 };
         // Convert the struct to a Cell and back
         let cell = s.toCell();
         let s2 = One.fromCell(cell);
         dump(s2.number); // Expected: 42
    }
    
    receive() {
         self.run();
    }
}
