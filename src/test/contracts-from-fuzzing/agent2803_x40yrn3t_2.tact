struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    data: DataStruct;
}

struct DataStruct {
    val: Int;
    text: String;
}

contract ComplexNestedFields {
    field: DeeplyNested;

    init() {
        self.field = DeeplyNested{
            inner: InnerStruct{
                flag: true,
                data: DataStruct{
                    val: 123,
                    text: "hello"
                }
            }
        };
    }
}