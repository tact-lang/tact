struct Nested {
    inner: Int;
}

struct Outer {
    nest: Nested;
}

contract HasDeep {
    val: Outer;

    init() {
        self.val = Outer{nest: Nested{inner: 1}};
    }
}