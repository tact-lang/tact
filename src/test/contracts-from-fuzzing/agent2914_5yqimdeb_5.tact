struct MixedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    x: Int;
    y: String;
}

contract NestedOptionals2 {
    s: MixedOptional = MixedOptional{
        a: null,
        b: null,
        c: null,
        x: 1,
        y: "test"
    };

    init() {}
}