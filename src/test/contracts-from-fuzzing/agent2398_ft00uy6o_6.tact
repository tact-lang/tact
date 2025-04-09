struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: String?;
    f6: Int;
    f7: String;
    f8: Bool;
    f9: Int;
    f10: String?;
}

contract TestContract {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            f1: 1,
            f2: false,
            f3: "x",
            f4: null,
            f5: null,
            f6: 2,
            f7: "y",
            f8: true,
            f9: 3,
            f10: null
        };
    }
}