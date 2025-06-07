struct OptionalStruct {
    x: Int;
    y: String?;
}

contract OptStructField {
    st: OptionalStruct?;

    init() {
        self.st = null;
    }
}