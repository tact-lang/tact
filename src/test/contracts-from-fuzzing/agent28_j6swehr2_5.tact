/// Test case: Structs - Valid Usage
struct One { number: Int; }

contract TestStructs {
    fun run() {
        // Instantiate a struct with a field
        let o: One = One{ number: 99 };
        dump(o.number);
        // Convert the struct to a Cell and back
        let cell = o.toCell();
        let newO = One.fromCell(cell);
        dump(newO.number);
    }
    receive() {
        self.run();
    }
}
