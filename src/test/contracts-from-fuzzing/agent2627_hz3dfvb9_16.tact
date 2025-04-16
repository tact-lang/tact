struct OptionalStruct {
    x: Int;
}

contract OptStructField {
    s: OptionalStruct?;
    init() {
        self.s = OptionalStruct{x:42};
    }
}