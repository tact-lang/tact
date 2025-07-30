struct OptStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}