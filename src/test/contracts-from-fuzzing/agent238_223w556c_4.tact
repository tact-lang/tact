struct OptStruct {
    x: Int;
}

contract OptFieldTest {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}