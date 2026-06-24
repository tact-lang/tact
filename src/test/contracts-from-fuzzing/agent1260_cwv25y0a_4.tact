struct ManyFields {
    f1: Int = 1;
    f2: Bool = true;
    f3: String = "a";
    f4: Int = 4;
    f5: Bool = false;
    f6: String = "b";
    f7: Int = 7;
    f8: Bool = true;
    f9: String = "c";
}

contract ManyFieldsContract {
    data: ManyFields = ManyFields{};

    init() {
        self.data = ManyFields{
            f1: 11,
            f2: false,
            f3: "x",
            f4: 44,
            f5: true,
            f6: "y",
            f7: 77,
            f8: false,
            f9: "z"
        };
    }
}