struct OptStruct {
    i: Int;
}

contract OptionalTest {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}