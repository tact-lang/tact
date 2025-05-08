struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract StructPersist {
    nested: Nested = Nested{
        a: 7,
        b: true,
        c: "hi"
    };

    init() {}
}