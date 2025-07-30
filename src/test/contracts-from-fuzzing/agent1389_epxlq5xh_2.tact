struct Nested {
    inner: InnerStruct;
    flag: Bool;
}

struct InnerStruct {
    x: Int;
    y: Int?;
}

contract DeepTest {
    data: Nested;

    init() {
        self.data = Nested{
            inner: InnerStruct{
                x: 1,
                y: null,
            },
            flag: false,
        };
    }
}