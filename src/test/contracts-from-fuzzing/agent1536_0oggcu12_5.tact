struct S {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Cell;
    f8: Slice;
    f9: Address;
    f10: Int;
    f11: Bool;
    f12: String;
}

contract ManyTypes {
    s: S;

    init() {
        self.s = S{
            f1: 1,
            f2: null,
            f3: true,
            f4: false,
            f5: "hi",
            f6: null,
            f7: emptyCell(),
            f8: emptyCell().asSlice(),
            f9: myAddress(),
            f10: 0,
            f11: false,
            f12: "bye"
        };
    }
}