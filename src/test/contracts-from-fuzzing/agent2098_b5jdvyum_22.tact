struct Middle {
    v1: Int;
    v2: Int?;
    v3: Bool;
}

struct Outer {
    m: Middle?;
}

contract OuterNullable {
    x: Outer = Outer{m: null};
}
