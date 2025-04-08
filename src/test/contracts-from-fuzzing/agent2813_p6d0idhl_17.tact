struct OptionalSub {
    inner: Inner?;
}

struct Inner {
    flag: Bool;
}

struct Container {
    nested: OptionalSub;
}

contract TestOptionalDeep {
    s: Container;

    init() {
        self.s = Container{
            nested: OptionalSub{
                inner: null
            }
        };
    }
}
