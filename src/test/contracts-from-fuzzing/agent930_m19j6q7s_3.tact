struct Large {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: Int;
    f6: String;
    f7: Bool;
    f8: Int;
    f9: String;
    f10: Bool?;
    f11: Int;
    f12: String;
}

contract LargeFields {
    big: Large;

    init() {
        self.big = Large{
            f1: 1,
            f2: false,
            f3: "three",
            f4: null,
            f5: 5,
            f6: "six",
            f7: true,
            f8: 8,
            f9: "nine",
            f10: true,
            f11: 11,
            f12: "twelve"
        };
    }
}