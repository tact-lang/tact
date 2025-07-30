struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int;
}

contract DeepNestTest {
    point: Nested;

    init() {
        self.point = Nested{
            inner: InnerStruct{
                x: 10,
                y: 20,
            }
        };
    }
}