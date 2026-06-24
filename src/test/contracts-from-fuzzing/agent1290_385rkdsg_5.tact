struct VeryLong {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: Int?;
    f6: String?;
    f7: Bool;
    f8: Int;
    f9: String;
    f10: Bool;
    f11: Int?;
    f12: String?;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Int?;
    f17: String?;
    f18: Bool;
    f19: Int;
    f20: String;
}

contract TestContract {
    longData: VeryLong;

    init() {
        self.longData = VeryLong{
            f1: 1, f2: 2, f3: true, f4: "a", f5: null, f6: null, f7: false, f8: 8, f9: "b",
            f10: true, f11: null, f12: null, f13: 13, f14: false, f15: "c", f16: null, f17: null,
            f18: true, f19: 19, f20: "d"
        };
    }

    receive() {
        self.longData = VeryLong{
            f1: 10, f2: 20, f3: false, f4: "x", f5: 5, f6: "foo", f7: true, f8: 80, f9: "y",
            f10: false, f11: 11, f12: "bar", f13: 130, f14: true, f15: "z", f16: 16, f17: "baz",
            f18: false, f19: 190, f20: "w"
        };
    }
}