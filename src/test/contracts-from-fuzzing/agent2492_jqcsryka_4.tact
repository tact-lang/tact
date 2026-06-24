struct Large {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: String;
    f5: Bool;
    f6: Int;
    f7: String;
    f8: Bool;
    f9: Int?;
    f10: String;
}

contract LargeFields {
    big: Large;

    init() {
        self.big = Large{
            f1: 1,
            f2: true,
            f3: null,
            f4: "abc",
            f5: false,
            f6: 42,
            f7: "xyz",
            f8: true,
            f9: null,
            f10: "end"
        };
    }
}