struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String?;
    f6: Bool?;
    f7: Int;
    f8: Bool;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: false,
            f3: "hi",
            f4: null,
            f5: null,
            f6: true,
            f7: 99,
            f8: true,
        };
    }
}