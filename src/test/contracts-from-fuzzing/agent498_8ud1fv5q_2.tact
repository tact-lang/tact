struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    i: Int;
    nested: Inner;
    flag: Bool;
    text: String;
    optInt: Int?;
    optBool: Bool?;
}

contract TestOuter {
    data: Outer = Outer{
        i: 1,
        nested: Inner{x: 10, y: false},
        flag: true,
        text: "test",
        optInt: null,
        optBool: true
    };
}