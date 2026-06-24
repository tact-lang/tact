struct PrimitivesMassive {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Int;
    f5: Bool;
    f6: String;
    f7: String;
    f8: Bool;
    f9: Int;
    f10: Bool;
    f11: String;
    f12: Int;
    f13: String;
}

contract BigPrimitiveStruct {
    big: PrimitivesMassive = PrimitivesMassive{
        f1: 1,
        f2: 2,
        f3: true,
        f4: 4,
        f5: false,
        f6: "a",
        f7: "b",
        f8: true,
        f9: 9,
        f10: false,
        f11: "c",
        f12: 12,
        f13: "d"
    };

    receive() {
        self.big = self.big;
    }
}