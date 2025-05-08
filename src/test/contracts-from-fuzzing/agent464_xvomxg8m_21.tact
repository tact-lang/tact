struct OptionalStruct {
    x: Int?;
    y: Bool?;
}

contract OptionalStructHolder {
    nested: OptionalStruct?;

    init() {
        self.nested = null;
    }
}
