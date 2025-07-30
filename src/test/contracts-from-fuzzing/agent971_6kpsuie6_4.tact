struct OptionalStruct {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract OptionalFieldTest {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{ x: null, y: null, s: null };
    }

    receive() {}
}