struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract OptStructField {
    os: OptionalStruct?;

    init() {
        self.os = null;
    }
}