struct Combo {
    num: Int;
    flag: Bool;
    text: String;
    numOpt: Int?;
    flagOpt: Bool?;
    textOpt: String?;
}

contract Test {
    combo: Combo = Combo{
        num: 42,
        flag: true,
        text: "hello",
        numOpt: null,
        flagOpt: null,
        textOpt: null,
    };

    init() {}
}