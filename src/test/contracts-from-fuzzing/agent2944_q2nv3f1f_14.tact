struct S {
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
}

contract BigStructField {
    s: S;

    init() {
        self.s = S{
            f1: 1, f2: true, f3: "one", f4: null, f5: false, f6: null, f7: 2, f8: false, f9: "two", f10: 999
        };
    }
}