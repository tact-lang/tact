struct OptionalContainer {
    value: Int?;
    flag: Bool?;
    nested: Inner?;
}

struct Inner {
    x: Int;
}

contract Test {
    storage: OptionalContainer;

    init() {
        self.storage = OptionalContainer{
            value: null,
            flag: true,
            nested: null
        };
    }
}