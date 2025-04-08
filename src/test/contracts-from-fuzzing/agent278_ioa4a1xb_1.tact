struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
}

contract DeepNestTest {
    val: Nested;

    init() {
        self.val = Nested{
            inner: InnerStruct{ x: 1, y: null }
        };
    }
}