struct NestedOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    value: Int?;
}

contract NestedOptionalTest {
    store: NestedOptional;

    init() {
        self.store = NestedOptional{
            inner: null
        };
    }
}