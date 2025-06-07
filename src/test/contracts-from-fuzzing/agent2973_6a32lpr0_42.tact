struct DeepOptionals {
    i: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract OptionalDefaultStruct {
    nested: DeepOptionals?;

    init() {
        self.nested = null;
    }
}