struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    stuff: OptionalStruct?;

    init() {
        self.stuff = null;
    }
}