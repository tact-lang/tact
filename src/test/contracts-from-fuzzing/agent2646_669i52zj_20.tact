struct OptStruct {
    foo: Int?;
}

contract OptionalStructField {
    s: OptStruct?;
    init() {
        self.s = null;
    }
    receive() {}
}