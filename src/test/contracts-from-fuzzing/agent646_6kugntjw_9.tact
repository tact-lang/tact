struct OptionalStruct {
    a: Int;
}

contract OptStructTest {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}