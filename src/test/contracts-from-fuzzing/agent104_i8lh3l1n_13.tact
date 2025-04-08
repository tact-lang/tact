struct MixedOptional {
    optInt: Int?;
    optBool: Bool?;
    reqInt: Int;
    reqBool: Bool;
    optStr: String?;
}

contract MixedOptContract {
    m: MixedOptional;

    init() {
        self.m = MixedOptional{
            optInt: null,
            optBool: null,
            reqInt: 5,
            reqBool: true,
            optStr: "hi",
        };
    }
}
