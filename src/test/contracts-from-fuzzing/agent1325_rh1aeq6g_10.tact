struct OptionalStruct {
    x: Int;
}

contract OptStructField {
    inner: OptionalStruct?;

    init() {
        self.inner = OptionalStruct{x:5};
    }
}