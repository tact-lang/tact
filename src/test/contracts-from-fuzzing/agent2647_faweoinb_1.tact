struct NestedTest {
    inner: InnerStruct;
    optionalInner: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Int?;
}

contract StorageContract {
    nested: NestedTest;

    init() {
        self.nested = NestedTest{
            inner: InnerStruct{a: 1, b: 2},
            optionalInner: null
        };
    }
}