struct Wrapped {
    inner: Int;
}

struct ContainerOptional {
    wrap: Wrapped?;
}

contract OptionalInMiddleLayer {
    field: ContainerOptional;
    init() {
        self.field = ContainerOptional{
            wrap: null
        };
    }
}
