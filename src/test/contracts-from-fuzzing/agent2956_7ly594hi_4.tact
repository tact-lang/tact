struct LongList {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String?;
    f6: Bool?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int;
    f11: Bool;
    f12: String?;
}

contract TestContract {
    payload: LongList;

    init() {
        self.payload = LongList{
            f1: 1,
            f2: true,
            f3: "abc",
            f4: null,
            f5: null,
            f6: null,
            f7: 7,
            f8: false,
            f9: "xyz",
            f10: 10,
            f11: true,
            f12: null,
        };
    }
}
