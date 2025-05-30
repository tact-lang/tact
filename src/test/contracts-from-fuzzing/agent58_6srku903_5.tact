struct One { number: Int; }

contract StructConversionTest() {
    fun test() {
        // Create an instance of the struct One
        let instance: One = One{ number: 123 };
        // Convert the struct to a Cell and then back
        let cellRepresentation: Cell = instance.toCell();
        let instance2: One = One.fromCell(cellRepresentation);
        // Verify that the round-trip conversion maintains the value
        require(instance2.number == 123, "Struct round-trip conversion failed");
    }

    receive() {}
}
