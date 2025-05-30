struct Nested {
    field1: Int;
    field2: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            field1: 1,
            field2: true,
            inner: InnerStruct{ value: 42 }
        };
    }
}