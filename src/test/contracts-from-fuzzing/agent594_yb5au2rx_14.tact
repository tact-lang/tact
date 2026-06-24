struct StructA {
    a: Int;
    opt: Int?;
}

struct StructB {
    nested: StructA;
    x: Bool;
}

struct StructC {
    nested: StructB;
    y: String;
}

contract MultiDeepStruct {
    holder: StructC = StructC{
        nested: StructB{
            nested: StructA{
                a: 7,
                opt: null
            },
            x: false
        },
        y: "Test"
    };
}