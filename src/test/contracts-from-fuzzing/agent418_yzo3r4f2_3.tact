struct BigFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: String?;
    f6: Int?;
    f7: Bool;
    f8: Int;
    f9: String;
    f10: Int?;
}

contract ManyFields {
    val: BigFields = BigFields{
        f1: 1,
        f2: true,
        f3: "hi",
        f4: null,
        f5: "opt",
        f6: 42,
        f7: false,
        f8: 7,
        f9: "end",
        f10: null
    };

    receive() {
        self.val = BigFields{
            f1: 10,
            f2: false,
            f3: "new",
            f4: true,
            f5: null,
            f6: null,
            f7: true,
            f8: 11,
            f9: "fin",
            f10: 999
        };
    }
}