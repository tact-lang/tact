struct OptionalStruct {
    a: Int = 0;
    b: Bool = false;
}

contract OptionalStructField {
    s: OptionalStruct?;

    init() {
        self.s = null;
    }
}