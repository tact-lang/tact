struct OptionalNestedDeep {
    innerVal: Int?;
    innerText: String?;
}

struct ContainerOptional {
    id: Int;
    nested: OptionalNestedDeep?;
}

contract OptionalDeep {
    field: ContainerOptional;

    init() {
        self.field = ContainerOptional{
            id: 42,
            nested: OptionalNestedDeep{
                innerVal: 11,
                innerText: null
            }
        };
    }
}