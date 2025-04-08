struct OptionalNested {
    nested: Inner?;
}

struct Inner {
    v: Int;
}

contract OptNestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nested: Inner{v:123}
        };
    }
}