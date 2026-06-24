struct InnerStruct {
    field1: Int;
    field2: Bool?;
}

contract TestContract {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            field1: 10,
            field2: true
        };
    }
}