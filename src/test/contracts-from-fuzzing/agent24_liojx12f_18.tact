struct MultiNested {
    a: Int;
    b: Bool;
    c: String;
    d: String?;
    e: Int?;
    f: Bool?;
}

contract Test {
    mn: MultiNested = MultiNested{
        a: 1,
        b: false,
        c: "abc",
        d: null,
        e: null,
        f: null,
    };

    init() {}
}