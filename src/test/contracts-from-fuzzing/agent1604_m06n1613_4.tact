struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Bool?;
    f8: Address?;
    f9: Int?;
    f10: Cell?;
}

contract VarietyTest {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: "hello",
            f7: false,
            f8: null,
            f9: null,
            f10: null
        };
    }

    receive() {}
}