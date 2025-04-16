struct Combination {
    opt1: Int?;
    opt2: Bool?;
    val1: Int;
    val2: Bool;
    strOpt: String?;
    strVal: String;
}

contract MixedFields {
    combined: Combination = Combination{
        opt1: null,
        opt2: null,
        val1: 5,
        val2: true,
        strOpt: null,
        strVal: "hello"
    };

    init() {}
}