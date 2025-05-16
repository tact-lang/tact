struct OptStruct {
    i: Int;
    s: String;
    b: Bool;
}

contract OptionalStructField {
    maybeData: OptStruct?;

    init() {
        self.maybeData = null;
    }
}