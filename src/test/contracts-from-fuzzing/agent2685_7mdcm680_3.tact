struct Nested {
    inner: Inner;
    flag: Bool;
}

struct Inner {
    x: Int;
    y: Int?;
}

contract Test {
    nested: Nested = Nested{ inner: Inner{ x: 42, y: null }, flag: true };
}
