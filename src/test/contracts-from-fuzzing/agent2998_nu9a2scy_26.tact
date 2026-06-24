struct ParamType {
    i: Int;
    s: String;
    b: Bool;
    oInt: Int?;
    oStr: String?;
    oBool: Bool?;
}

contract ParamsAsField {
    param: ParamType;
    init() {
        self.param = ParamType{
            i: 42,
            s: "hello",
            b: false,
            oInt: null,
            oStr: null,
            oBool: null,
        };
    }
}