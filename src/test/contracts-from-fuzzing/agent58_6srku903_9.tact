struct SerializationTest {
    a: Int as int64;
    b: Int as uint51;
    c: Int as int257;
}

contract TestSerialization() {
    fun test() {
        // Create an instance of SerializationTest with specific values
        let inst: SerializationTest = SerializationTest{ a: -42, b: 100, c: 123 };
        // Serialize the struct into a cell
        let cellRepresentation: Cell = inst.toCell();
        // Deserialize it back into a struct
        let inst2: SerializationTest = SerializationTest.fromCell(cellRepresentation);
        // Verify that the round-trip preserves the values
        require(inst2.a == -42, "Error: a mismatch");
        require(inst2.b == 100, "Error: b mismatch");
        require(inst2.c == 123, "Error: c mismatch");
    }
    
    receive() {
        self.test();
    }
}
