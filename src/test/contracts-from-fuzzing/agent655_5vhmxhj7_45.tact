struct PStruct {
    x: Int;
    y: Int?;
    z: Bool;
    s: S2;
}

struct S2 {
    foo: Int?;
    bar: String;
}

contract ParamTest(
    data: PStruct
) {}