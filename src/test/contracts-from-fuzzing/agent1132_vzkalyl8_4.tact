struct VeryWide {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String;
    f6: Bool;
    f7: Int;
    f8: String;
    f9: Bool;
    f10: Int;
    f11: String;
    f12: Bool;
}

contract WideContract {
    wide: VeryWide = VeryWide{
        f1: 1, f2: true, f3: "a", f4: null, f5: "b", f6: false, f7: 7, f8: "c", f9: true, f10: 42, f11: "d", f12: false
    };

    init() {
        self.wide = VeryWide{
            f1: 2, f2: false, f3: "z", f4: 99, f5: "y", f6: true, f7: 8, f8: "x", f9: false, f10: 100, f11: "w", f12: true
        };
    }
}