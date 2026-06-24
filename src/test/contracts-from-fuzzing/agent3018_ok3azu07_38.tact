struct NestedAll {
    intF: Int;
    boolF: Bool;
    optInt: Int?;
    optBool: Bool?;
    strF: String;
    optStr: String?;
}

struct WrapNest {
    inner: NestedAll;
}

contract AllInOne {
    val: WrapNest = WrapNest{
        inner: NestedAll{
            intF: 42,
            boolF: true,
            optInt: null,
            optBool: false,
            strF: "xyz",
            optStr: null,
        }
    };
}
