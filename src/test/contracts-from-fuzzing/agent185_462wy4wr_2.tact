struct NestedStruct {
    inner: Int;
}

struct ContainerStruct {
    first: NestedStruct;
    second: Int;
}

contract NestedStructHolder {
    stored: ContainerStruct;

    init() {
        self.stored = ContainerStruct{
            first: NestedStruct{ inner: 7 },
            second: 100
        };
    }
}