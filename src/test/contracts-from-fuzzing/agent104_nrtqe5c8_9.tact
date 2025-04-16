struct NestedSimple {
    x: Int;
}

struct ContainerOptional {
    inner: NestedSimple?;
    flag: Bool;
}

contract StructFieldOptional {
    field: ContainerOptional;
    init() {
        self.field = ContainerOptional{
            inner: null,
            flag: true,
        };
    }
}