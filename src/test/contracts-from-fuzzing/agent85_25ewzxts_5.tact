struct One { number: Int; }

contract TestStruct() {
    fun test() {
        // Instantiate structure One
        let o: One = One{ number: 50 };
        // Convert the struct to a Cell
        let cell = o.toCell();
        // Recover the struct from the Cell
        let o2 = One.fromCell(cell);
        require(o2.number == 50, "Struct serialization/deserialization failed");
        dump(o2.number);
    }
}
