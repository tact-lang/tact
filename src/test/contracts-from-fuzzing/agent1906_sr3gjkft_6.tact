struct OptionalContainer {
    nested: Inner?;
}

struct Inner {
    b: Bool;
}

contract DeepOpt {
    data: OptionalContainer;

    init() {
        self.data = OptionalContainer{
            nested: null
        };
    }
}
