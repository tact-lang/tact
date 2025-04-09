struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
    flag: Bool;
}

contract TestContract {
    data: Nested;
    init() {
        self.data = Nested{
            inner: InnerStruct{
                value: 1,
                flag: true,
            },
        };
    }
}