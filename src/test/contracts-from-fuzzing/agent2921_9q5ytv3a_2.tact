struct A {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Cell;
    val5: Slice;
    val6: Builder;
    val7: Address;
    val8: Int?;
    val9: Bool?;
    val10: String?;
}

contract ManyFields {
    record: A;
    
    init() {
        self.record = A{
            val1: 1,
            val2: true,
            val3: "hi",
            val4: emptyCell(),
            val5: emptyCell().asSlice(),
            val6: beginCell(),
            val7: myAddress(),
            val8: null,
            val9: null,
            val10: null
        };
    }
}