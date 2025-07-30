struct OptStruct {
    foo: Int?;
}

contract OptFieldInitTest {
    box: OptStruct;
    toggle: Bool?;

    init() {
        self.box = OptStruct{ foo: null };
        self.toggle = null;
    }
}
