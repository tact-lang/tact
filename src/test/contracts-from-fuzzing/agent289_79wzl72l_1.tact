struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool;
    f5: Int;
    f6: Address;
    f7: Cell;
    f8: Bool;
    f9: Int;
    f10: String;
}

contract WidePersistentState {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            f1: 1,
            f2: false,
            f3: "hello",
            f4: true,
            f5: 42,
            f6: myAddress(),
            f7: emptyCell(),
            f8: true,
            f9: -1,
            f10: "world"
        };
    }
}