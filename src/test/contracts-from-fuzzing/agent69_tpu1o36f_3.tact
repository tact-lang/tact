struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool;
    f5: String;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Int;
}

contract WideStructContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: 2,
            f3: true,
            f4: false,
            f5: "five",
            f6: "six",
            f7: null,
            f8: null,
            f9: null,
            f10: 10
        };
    }
}