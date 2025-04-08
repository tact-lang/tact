struct BigStruct {
    val1: Int;
    val2: Bool;
    val3: Int?;
    val4: Bool?;
    val5: Address;
    val6: Address?;
    val7: Cell;
    val8: Cell?;
    val9: Slice;
    val10: Slice?;
    val11: String;
    val12: String?;
    val13: Int;
    val14: Bool;
}

contract ManyFields {
    field: BigStruct;
    init() {
        self.field = BigStruct{
            val1: 1, val2: true, val3: null, val4: null, val5: myAddress(), val6: null,
            val7: emptyCell(), val8: null, val9: emptyCell().asSlice(), val10: null,
            val11: "hello", val12: null, val13: 42, val14: false
        };
    }
}
