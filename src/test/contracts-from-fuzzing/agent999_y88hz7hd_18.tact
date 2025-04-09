struct OptionalStruct {
    inner: Int;
}

contract OptStructTest {
    os: OptionalStruct?;

    init() {
        self.os = null;
    }
}