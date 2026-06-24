struct MidStruct {
    a: Int;
    b: Bool;
}

struct OuterStruct {
    m: MidStruct;
    optInner: MidStruct?;
    flag: Bool;
}

contract NestedOptWithDefaults {
    data: OuterStruct = OuterStruct{
        m: MidStruct{ a: 3, b: true },
        optInner: null,
        flag: false,
    };
}