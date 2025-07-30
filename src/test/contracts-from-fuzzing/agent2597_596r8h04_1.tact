struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    value1: Int;
    value2: Bool;
    optionalVal: String?;
}

contract DeepTest {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerStruct{
                value1: 1,
                value2: true,
                optionalVal: null,
            },
        };
    }
}
