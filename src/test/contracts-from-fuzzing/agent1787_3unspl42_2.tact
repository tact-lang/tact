struct One {
    a: Int;
}

struct Two {
    b: Bool;
    c: One;
}

struct Three {
    d: Int;
    e: Two;
}

contract NestedStructsTest {
    nested: Three;

    init() {
        self.nested = Three{
            d: 1,
            e: Two{
                b: true,
                c: One{a: 42}
            }
        };
    }
}