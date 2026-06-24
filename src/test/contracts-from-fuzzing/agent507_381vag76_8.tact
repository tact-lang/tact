struct OptionalNested {
    f1: Int?;
    nested: Inner?;
}

struct Inner {
    v1: Int;
    v2: Bool?;
}

contract TestContract {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{
            f1: null,
            nested: null
        };
    }
}