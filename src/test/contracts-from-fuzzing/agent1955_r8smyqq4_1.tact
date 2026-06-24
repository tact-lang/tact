struct InnerStruct {
    field1: Int;
    field2: Bool;
}

struct OuterStruct {
    nested: InnerStruct;
    flag: Bool;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: InnerStruct{
                field1: 10,
                field2: true,
            },
            flag: false,
        };
    }
}
