struct NestedOptions {
    x: Int?;
    y: String?;
}

struct Outer {
    a: Int;
    b: NestedOptions;
    c: Bool?;
}

contract OptNest {
    val: Outer = Outer{
        a: 7,
        b: NestedOptions{ x: null, y: null },
        c: null,
    };
    init() {}
}