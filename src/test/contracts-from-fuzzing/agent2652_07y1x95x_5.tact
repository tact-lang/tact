struct NestedOptionalStruct {
    inner: Int?;
    text: String?;
}

struct WrapperStruct {
    nested: NestedOptionalStruct?;
}

contract OptionalInsideOptionalTest {
    data: WrapperStruct;

    init() {
        self.data = WrapperStruct{
            nested: NestedOptionalStruct{
                inner: 123,
                text: null
            }
        };
    }
}