struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Address;
    f6: Cell;
    f7: Slice;
    f8: Builder;
    f9: String?;
    f10: Bool?;
}

contract TestContract {
    data: BigStruct;
    init() {
        self.data = BigStruct{
            f1: 1,
            f2: true,
            f3: "hello",
            f4: null,
            f5: myAddress(),
            f6: emptyCell(),
            f7: emptyCell().asSlice(),
            f8: beginCell(),
            f9: null,
            f10: false
        };
    }
}