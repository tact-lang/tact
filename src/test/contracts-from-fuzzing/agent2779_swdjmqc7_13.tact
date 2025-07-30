struct OptionalNestedStruct {
    x: Int?;
    y: Bool?;
}

struct ContainerOptNested {
    inner: OptionalNestedStruct;
}

contract StructWithOptionalNested {
    data: ContainerOptNested;
    init() {
        self.data = ContainerOptNested{
            inner: OptionalNestedStruct{
                x: null,
                y: null
            }
        };
    }
}