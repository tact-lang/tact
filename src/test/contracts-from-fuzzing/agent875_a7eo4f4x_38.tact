struct NullableNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: String?;
}

contract NullableNestedTest {
    x: NullableNested;
    init() {
        self.x = NullableNested{
            inner: InnerStruct{
                a:5,
                b:null
            }
        };
    }
}