struct Nested {
    flag: Bool;
    name: String;
    inner: InnerStruct;
}

struct InnerStruct {
    count: Int;
    enabled: Bool;
    optValue: Int?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            flag: true,
            name: "hello",
            inner: InnerStruct{
                count: 42,
                enabled: false,
                optValue: null,
            },
        };
    }
}
