struct ManyFields {
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

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1, f2: true, f3: "a", f4: null, f5: false, f6: null, f7: 7, f8: true, f9: "x", f10: null
        };
    }
}