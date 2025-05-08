struct BigStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Bool;
    f8: String;
    f9: Bool?;
    f10: String?;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            f1: 1,
            f2: 2,
            f3: 3,
            f4: 4,
            f5: 5,
            f6: 6,
            f7: true,
            f8: "hello",
            f9: null,
            f10: null,
        };
    }
}