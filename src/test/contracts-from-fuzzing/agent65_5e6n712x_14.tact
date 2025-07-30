struct StructWithOptionalStruct {
    inner: StructInner?;
}

struct StructInner {
    value: Int;
}

contract OptionalStructTest {
    data: StructWithOptionalStruct;

    init() {
        self.data = StructWithOptionalStruct{
            inner: StructInner { value: 42 }
        };
    }
}
