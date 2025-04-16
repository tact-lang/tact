struct HasBoolIntStrings {
    i: Int;
    b: Bool;
    s: String;
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract TestMix {
    data: HasBoolIntStrings;
    init() {
        self.data = HasBoolIntStrings{
            i: 1,
            b: true,
            s: "string",
            oi: null,
            ob: false,
            os: "opt"
        };
    }
}