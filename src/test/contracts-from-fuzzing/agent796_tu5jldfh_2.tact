struct LargeFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: String;
    f5: Bool?;
    f6: Int;
    f7: Int?;
    f8: String;
    f9: Bool?;
    f10: Int;
}

contract TestContract {
    storage: LargeFields;

    init() {
        self.storage = LargeFields{
            f1: 1,
            f2: true,
            f3: null,
            f4: "x",
            f5: null,
            f6: 2,
            f7: null,
            f8: "y",
            f9: null,
            f10: 3,
        };
    }
}