struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Bool;
    f6: Int;
    f7: String;
    f8: Bool;
    f9: Int?;
    f10: String;
    f11: Bool;
    f12: Cell;
    f13: String;
    f14: Bool;
}

contract TestContract {
    bigData: BigStruct;

    init() {
        self.bigData = BigStruct{
            f1: 1,
            f2: true,
            f3: "test",
            f4: emptyCell(),
            f5: false,
            f6: 42,
            f7: "hello",
            f8: true,
            f9: null,
            f10: "world",
            f11: false,
            f12: emptyCell(),
            f13: "sample",
            f14: true
        };
    }
}