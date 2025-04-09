struct OptStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    maybeS: OptStruct?;

    init() {
        self.maybeS = null;
    }
}