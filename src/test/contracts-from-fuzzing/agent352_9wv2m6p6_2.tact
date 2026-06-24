struct DeepNested {
    inner: Nested;
}

struct Nested {
    a: Int?;
    b: Bool?;
    sub: SubStruct;
}

struct SubStruct {
    x: Int;
    y: Bool;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: Nested{
                a: null,
                b: true,
                sub: SubStruct{
                    x: 123,
                    y: false
                }
            }
        };
    }
}