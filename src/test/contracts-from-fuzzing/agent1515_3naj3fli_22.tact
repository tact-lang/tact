struct OptionalStruct {
    inner: Int;
}

contract OptNestedStructInOpt {
    top: OptionalStruct?;

    init() {
        self.top = null;
    }
}