struct OptionalNested {
    value: Int?;
}

struct OptionalContainer {
    nested: OptionalNested?;
}

contract OptionalDeep {
    data: OptionalContainer;

    init() {
        self.data = OptionalContainer{
            nested: null
        };
    }
}