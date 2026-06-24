struct Large {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: String;
    f12: String;
    f13: Bool;
    f14: Bool;
}

contract LargeNested {
    data: Large;

    init() {
        self.data = Large{
            f1: 1, f2: 2, f3: 3, f4: 4, f5: 5, f6: 6, f7: 7, f8: 8, f9: 9, f10: 10,
            f11: "s", f12: "t", f13: true, f14: false
        };
    }
}