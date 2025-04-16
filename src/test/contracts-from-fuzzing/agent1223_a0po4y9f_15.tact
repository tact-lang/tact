struct Wrapper {
    inner: InnerOptional?;
}

struct InnerOptional {
    foo: Int?;
}

contract WrapperTest {
    testField: Wrapper;
    init() {
        self.testField = Wrapper{ inner: null };
    }
}