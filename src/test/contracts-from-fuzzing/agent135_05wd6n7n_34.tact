struct WrappingAll {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract FullWrap {
    data: WrappingAll;

    init() {
        self.data = WrappingAll{
            intVal: 1,
            boolVal: true,
            strVal: "str",
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}
