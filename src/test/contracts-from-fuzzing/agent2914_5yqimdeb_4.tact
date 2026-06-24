struct InnerStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    optInner: InnerStruct?;
    x: String;
}

contract NestedOptionalStruct {
    field: OuterStruct = OuterStruct{ optInner: null, x: "hi" };

    init() {}
}