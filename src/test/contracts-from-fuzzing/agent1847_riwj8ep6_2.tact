struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestNestedStruct {
    nested: Inner = Inner{
        a: 1,
        b: true,
        c: "test",
    };
}
