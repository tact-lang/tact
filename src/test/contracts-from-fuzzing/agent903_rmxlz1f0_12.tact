struct OptionalStruct {
    x: Int;
}

contract OptStructField {
    f: OptionalStruct?;

    init() {
        self.f = null;
    }
}