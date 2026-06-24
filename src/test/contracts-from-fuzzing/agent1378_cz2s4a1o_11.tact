struct NestedOptStruct {
    inner: Int?;
    message: String;
}

struct ContainerStruct {
    nested: NestedOptStruct;
}

contract Layered {
    field: ContainerStruct = ContainerStruct{nested: NestedOptStruct{inner:null, message:""}};
    init() {
        self.field = ContainerStruct{nested: NestedOptStruct{inner:42, message:"hello"}};
    }
    receive() {}
}