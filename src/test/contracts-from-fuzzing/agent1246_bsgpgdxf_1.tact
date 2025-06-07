struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    field1: Int;
    field2: Bool?;
    field3: String;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerStruct{
                field1: 1,
                field2: true,
                field3: "hello",
            },
        };
    }
}