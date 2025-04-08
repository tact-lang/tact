struct NestedInner {
    a: Int;
    b: Bool?;
}

struct Nested {
    inner: NestedInner;
    val: Int?;
}

contract DeepStructTest {
    s: Nested;

    init() {
        self.s = Nested{
            inner: NestedInner{a: 1, b: true},
            val: null,
        };
    }
}