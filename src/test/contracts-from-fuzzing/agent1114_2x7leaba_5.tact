struct NestedOptionals {
    f1: Int?;
    f2: Bool?;
    f3: Inner?;
}

struct Inner {
    x: Int;
}

contract NestedOptFields {
    data: NestedOptionals;
    init() {
        self.data = NestedOptionals{
            f1: null,
            f2: true,
            f3: Inner{x: 42}
        };
    }
}