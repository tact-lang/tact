struct ManyFields {
    a1: Int;
    a2: Bool;
    a3: Int;
    a4: String;
    a5: Int?;
    a6: Bool?;
    a7: String?;
    a8: Int;
    a9: Bool;
    a10: String;
    a11: Int;
    a12: Bool?;
    a13: Int?;
    a14: String?;
    a15: Int;
    a16: Bool;
}

contract TestContract {
    big: ManyFields;

    init() {
        self.big = ManyFields{
            a1: 1,
            a2: true,
            a3: 3,
            a4: "four",
            a5: null,
            a6: null,
            a7: null,
            a8: 8,
            a9: false,
            a10: "ten",
            a11: 11,
            a12: true,
            a13: 13,
            a14: "fourteen",
            a15: 15,
            a16: false
        };
    }
}