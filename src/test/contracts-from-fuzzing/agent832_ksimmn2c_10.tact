struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalInContract {
    foo: OptionalStruct?;

    init() {
        self.foo = null;
    }
}