struct Large {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool;
    f5: String;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Int;
    f11: Bool;
    f12: String;
    f13: Int;
    f14: Bool;
    f15: String;
}

contract LargeContract {
    data: Large;

    init() {
        self.data = Large{
            f1: 1, f2: 2, f3: true, f4: false,
            f5: "a", f6: "b", f7: null, f8: null, f9: null,
            f10: 10, f11: true, f12: "ok",
            f13: 13, f14: false, f15: "end"
        };
    }
}