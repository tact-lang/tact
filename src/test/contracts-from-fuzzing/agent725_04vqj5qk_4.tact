struct OptStruct {
    s: String;
}

contract OptionalStructFieldTest {
    value: OptStruct?;

    init() {
        self.value = null;
    }
}