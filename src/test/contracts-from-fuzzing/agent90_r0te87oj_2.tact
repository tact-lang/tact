struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
}

contract TestContract {
    nested: Inner = Inner{
        a: 1,
        b: true,
        c: "abc",
        d: null
    };
}