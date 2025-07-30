struct NestedStringBool {
    s: String;
    b: Bool;
}

struct ContainerStruct {
    nested: NestedStringBool;
}

contract NestedContainers {
    data: ContainerStruct;

    init() {
        self.data = ContainerStruct{
            nested: NestedStringBool{
                s: "hello",
                b: true
            }
        };
    }
}