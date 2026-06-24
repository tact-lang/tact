struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool;
    f5: String;
    f6: Int?;
    f7: String?;
    f8: Bool;
    f9: Int;
    f10: String;
}

contract LargeStructTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: 2,
            f3: true,
            f4: false,
            f5: "five",
            f6: null,
            f7: "seven",
            f8: true,
            f9: 9,
            f10: "ten",
        };
    }
}