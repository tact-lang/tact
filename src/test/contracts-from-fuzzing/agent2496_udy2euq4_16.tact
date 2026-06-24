// deliberately very long struct with many fields and types
struct CrazyLong {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
    a8: Int;
    a9: Int;
    a10: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    s1: String;
    s2: String;
    opt1: Int?;
    opt2: String?;
    opt3: Bool?;
}

contract ManyFieldsOfDifferentKinds {
    val: CrazyLong;

    init() {
        self.val = CrazyLong{
            a1: 1, a2: 2, a3: 3, a4: 4, a5: 5,
            a6: 6, a7: 7, a8: 8, a9: 9, a10: 10,
            b1: true, b2: false, b3: true,
            s1: "first", s2: "second",
            opt1: null, opt2: "maybe", opt3: null,
        };
    }
}
