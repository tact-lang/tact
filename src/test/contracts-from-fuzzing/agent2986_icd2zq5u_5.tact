struct LargeStruct {
    f0: Int;
    f1: Bool;
    f2: Address;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Int;
    f8: Bool;
    f9: String;
}

contract ManyFields {
    lf: LargeStruct;

    init() {
        self.lf = LargeStruct{
            f0: 1,
            f1: true,
            f2: myAddress(),
            f3: "test",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: beginCell(),
            f7: 42,
            f8: false,
            f9: "another"
        };
    }
}