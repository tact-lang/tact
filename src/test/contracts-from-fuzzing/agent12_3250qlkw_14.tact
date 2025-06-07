struct OptionalStructWithNullDefaults {
    x: Int?;
    y: Bool?;
}

contract OptionalDefaults {
    opt: OptionalStructWithNullDefaults?;

    init() {
        self.opt = null;
    }
}