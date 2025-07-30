struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
}

contract NestedMixed {
    f: Mixed = Mixed{
        a: 7,
        b: false,
        c: "hello",
        d: null,
    };
}