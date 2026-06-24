struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    count: Int;
    text: String;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerStruct{
                flag: true,
                count: 42,
                text: "hello",
            },
        };
    }
}