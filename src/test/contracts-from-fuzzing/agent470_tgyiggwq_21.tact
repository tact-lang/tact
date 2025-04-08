struct StrStruct {
    s: String;
    os: String?;
    b: Bool;
    ob: Bool?;
    i: Int;
    oi: Int?;
}

contract MixStr {
    x: StrStruct;
    init() {
        self.x = StrStruct{
            s: "hi",
            os: null,
            b: true,
            ob: null,
            i: 5,
            oi: null
        };
    }
}