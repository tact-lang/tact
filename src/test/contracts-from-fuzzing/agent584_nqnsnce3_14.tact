struct Combo {
    n: Int;
    flag: Bool;
    txt: String;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract Test {
    c: Combo = Combo {
        n: -5,
        flag: false,
        txt: "hello",
        optInt: null,
        optStr: null,
        optBool: null
    };
}