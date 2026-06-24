struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    x: Int?;
    nested: Inner?;
}

contract FlexOpt {
    data: Outer = Outer{ x: null, nested: null };
}