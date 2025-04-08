struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String;
    f7: Int;
    f8: Bool;
}

contract Test {
    state: ManyFields;

    init() {
        self.state = ManyFields{
            f1: 1,
            f2: true,
            f3: "x",
            f4: null,
            f5: false,
            f6: "y",
            f7: 7,
            f8: false,
        };
    }
}