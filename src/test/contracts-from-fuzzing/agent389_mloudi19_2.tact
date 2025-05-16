struct Nested {
    a: Int;
    b: Int;
}

struct Outer {
    inner: Nested;
    c: Int;
}

contract UseOuter {
    outer: Outer;

    init() {
        self.outer = Outer{inner: Nested{a: 1, b: 2}, c: 3};
    }
}
