struct SimpleStruct {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Slice;
    val5: Cell;
    val6: Address;
    val7: Int?;
    val8: Bool?;
    val9: String?;
    val10: Cell?;
}

contract VariedStructContract {
    example: SimpleStruct;

    init() {
        self.example = SimpleStruct{
            val1: 1,
            val2: false,
            val3: "hi",
            val4: emptyCell().asSlice(),
            val5: emptyCell(),
            val6: myAddress(),
            val7: null,
            val8: null,
            val9: null,
            val10: null,
        };
    }
}