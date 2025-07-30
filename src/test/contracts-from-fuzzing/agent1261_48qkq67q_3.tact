struct Huge {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
    f11: Bool?;
    f12: String?;
}

contract BigStorage {
    massive: Huge;

    init() {
        self.massive = Huge{
            f1: 1, f2: true, f3: "s", f4: null, f5: null, f6: null,
            f7: 2, f8: false, f9: "t", f10: null, f11: null, f12: null
        };
    }
}