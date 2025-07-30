struct LargeFlat {
    f1: Int;
    f2: Bool;
    f3: Int;
    f4: String;
    f5: Bool;
    f6: String;
    f7: Int?;
    f8: Bool;
    f9: String;
    f10: Int;
    f11: Bool;
    f12: String?;
}

contract LargeFlatStorage {
    data: LargeFlat;

    init() {
        self.data = LargeFlat{
            f1: 1,
            f2: true,
            f3: 2,
            f4: "a",
            f5: false,
            f6: "b",
            f7: null,
            f8: true,
            f9: "c",
            f10: 10,
            f11: false,
            f12: null,
        };
    }
}
