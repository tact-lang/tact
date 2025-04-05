/// TestDefaultStruct: Verify that default field values are correctly applied during struct serialization/deserialization

struct DefaultStruct {
    a: Int = 10;
    b: Int?; // optional field, default is null
}

contract TestDefaultStruct {
    fun run() {
        let d: DefaultStruct = DefaultStruct{}; // omit fields with defaults
        let cell: Cell = d.toCell();
        let d2: DefaultStruct = DefaultStruct.fromCell(cell);
        // Verify that the default value for 'a' is correctly retained
        if (d2.a != 10) {
            throw(77);
        }
        // Also, 'b' should be null
        if (d2.b != null) {
            throw(78);
        }
        return;
    }

    receive() {
        self.run();
    }
}
