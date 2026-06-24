struct OptionalStringStruct {
    s: String?;
}

contract NullStrOpt {
    x: OptionalStringStruct?;

    init() {
        self.x = null;
    }
}