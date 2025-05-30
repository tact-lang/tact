struct OptionalStruct {
    data: Int;
}

contract OptionalStructFieldTest {
    inner: OptionalStruct?;

    init() {
        self.inner = OptionalStruct{data: 123};
    }
}