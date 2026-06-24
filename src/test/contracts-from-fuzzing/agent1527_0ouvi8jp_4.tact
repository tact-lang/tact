struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Cell;
    f6: Int?;
    f7: Bool;
    f8: Address;
    f9: String;
    f10: Cell;
}

contract TestContract {
    data: LargeStruct;
    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: "hello",
            f5: emptyCell(),
            f6: null,
            f7: false,
            f8: myAddress(),
            f9: "world",
            f10: emptyCell()
        };
    }
}
