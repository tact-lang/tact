struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int;
    f6: Bool;
    f7: String;
    f8: Address;
    f9: Int;
    f10: Bool;
}

contract LargeStructStorage {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            f1: 1,
            f2: true,
            f3: "a",
            f4: myAddress(),
            f5: 2,
            f6: false,
            f7: "b",
            f8: myAddress(),
            f9: 3,
            f10: true
        };
    }
}
