struct ContainsPersistent {
    field1: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract DeepInit {
    data: ContainsPersistent;

    init() {
        self.data = ContainsPersistent{
            field1: 1,
            inner: InnerStruct{ value: 2 }
        };
    }
}