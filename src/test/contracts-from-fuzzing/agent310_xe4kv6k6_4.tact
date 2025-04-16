struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: Int?;
    f10: Bool?;
    f11: String;
    f12: String?;
}

contract WideStructTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1, f2: true, f3: null, f4: false,
            f5: "a", f6: null, f7: 2, f8: false,
            f9: null, f10: true, f11: "b", f12: null
        };
    }
}