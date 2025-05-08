struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool;
    f5: String;
    f6: String;
    f7: Bool;
    f8: Int;
    f9: String;
    f10: Bool;
}

contract TestManyFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1, f2: 2, f3: true, f4: false, f5: "a",
            f6: "b", f7: true, f8: 8, f9: "c", f10: false,
        };
    }
}
