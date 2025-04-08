struct NestedStruct {
    val: Int;
}

struct ContainerStruct {
    first: NestedStruct;
    second: NestedStruct;
    third: NestedStruct;
}

contract TestContract {
    storage: ContainerStruct;

    init() {
        self.storage = ContainerStruct {
            first: NestedStruct{ val: 1 },
            second: NestedStruct{ val: 2 },
            third: NestedStruct{ val: 3 },
        };
    }
}