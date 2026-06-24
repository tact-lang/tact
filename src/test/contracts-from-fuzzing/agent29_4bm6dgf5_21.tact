struct NestedStructWithOptional {
    a: Int;
    inner: InnerStruct?;
}

struct InnerStruct {
    b: Int;
    c: Int?;
}

contract NestedStructWithOptionalTest {
    x: NestedStructWithOptional;

    init() {
        self.x = NestedStructWithOptional{
            a:1,
            inner:null
        };
    }
}