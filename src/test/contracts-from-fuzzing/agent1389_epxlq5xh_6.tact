struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
}

contract LotsOfFields {
    a: ManyFields;

    init() {
        self.a = ManyFields{
            f1: 1,
            f2: false,
            f3: null,
            f4: true,
            f5: "Five",
            f6: "Six",
            f7: 7,
            f8: false,
            f9: "Nine",
            f10: 10,
        };
    }
}