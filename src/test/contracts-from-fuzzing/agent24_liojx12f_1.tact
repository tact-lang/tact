struct Nested {
    a: Int;
    b: Bool;
    c: String?;
}

contract Test {
    x: Int = 1;
    y: Bool = true;
    z: Nested = Nested{
        a: 5,
        b: false,
        c: null,
    };

    init() {}
}