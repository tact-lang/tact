// Compose nested optional filled with nulls at bottom layer
struct Sub {
    a: Int?;
    b: Bool?;
}

struct Outer {
    s: Sub?;
}

contract Test {
    outer: Outer = Outer{
        s: Sub{
            a: null,
            b: null
        }
    };
    init() {}
}