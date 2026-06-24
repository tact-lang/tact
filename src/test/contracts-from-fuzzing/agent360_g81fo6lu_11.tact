struct OptionalNested {
    innerA: Inner?;
    innerB: Inner?;
}

struct Inner {
    f: Int;
}

contract TestContract {
    nested: OptionalNested;

    init() {
        self.nested = OptionalNested{
            innerA: Inner{ f: 42 },
            innerB: null,
        };
    }
}