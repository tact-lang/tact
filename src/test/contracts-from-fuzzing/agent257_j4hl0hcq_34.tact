struct InnerMost {
    z: Int;
}

struct Nested {
    inner: InnerMost;
}

contract NestedInit {
    n: Nested;
    init() {
        self.n = Nested{inner: InnerMost{z: 999}};
    }
}