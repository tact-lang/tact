struct OptStruct {
    foo: Int;
}

contract OptTest {
    x: OptStruct?;

    init() {
        self.x = null;
    }
}