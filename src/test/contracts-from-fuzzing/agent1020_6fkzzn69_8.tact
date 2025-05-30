struct OptionalStruct {
    val: Int;
}

contract NullStructField {
    f: OptionalStruct?;

    init() {
        self.f = null;
    }
}