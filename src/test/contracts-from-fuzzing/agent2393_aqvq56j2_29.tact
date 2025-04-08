struct Mix {
    i: Int;
    b: Bool;
    s: String;
    oInt: Int?;
    oBool: Bool?;
    oStr: String?;
}

contract MixAll {
    m: Mix = Mix{
        i: 1, b: false, s: "tact",
        oInt: null, oBool: true, oStr: null
    };
}