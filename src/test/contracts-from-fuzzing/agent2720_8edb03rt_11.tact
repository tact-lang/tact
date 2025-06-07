struct Mix {
    num: Int;
    optNum: Int?;
    label: String;
    maybe: Bool?;
}

contract Test {
    m: Mix = Mix{
        num: 123,
        optNum: null,
        label: "MixTest",
        maybe: null
    };
}