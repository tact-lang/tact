struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Address;
}

contract TestContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: true,
            f3: "hello",
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: 7,
            f8: false,
            f9: "world",
            f10: myAddress()
        };
    }
}