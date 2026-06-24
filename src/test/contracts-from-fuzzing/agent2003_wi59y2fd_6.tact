struct Outer {
    nested1: Nested;
    nested2: OptionalNested;
    flag: Bool;
}

struct Nested {
    inner: Inner;
    flag: Bool;
}

struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            nested1: Nested{
                inner: Inner{
                    x: 100,
                    y: false,
                },
                flag: true,
            },
            nested2: OptionalNested{
                inner: null,
            },
            flag: false,
        };
    }
}
