struct BigNestedStruct {
    i1: Int;
    b1: Bool;
    s1: String;
    o1: Int?;
    inner: InnerStruct;
}

struct InnerStruct {
    i2: Int;
    b2: Bool;
    s2: String;
    o2: Bool?;
}

contract BigNestedContract {
    big: BigNestedStruct = BigNestedStruct{
        i1: 10,
        b1: true,
        s1: "str",
        o1: null,
        inner: InnerStruct{
            i2: 20,
            b2: false,
            s2: "in",
            o2: null,
        }
    };

    receive() {}
}