struct NestedNested {
    x: Int;
    y: Bool;
}

struct Nested {
    m: String;
    n: NestedNested;
}

struct TopLevel {
    id: Int;
    inner: Nested;
}

contract DeepNestTest {
    foo: TopLevel;

    init() {
        self.foo = TopLevel{
            id: 42,
            inner: Nested{
                m: "hi",
                n: NestedNested{
                    x: 7,
                    y: false
                }
            }
        };
    }

    receive() {
        let _ = self.foo.inner.n.x;
    }
}