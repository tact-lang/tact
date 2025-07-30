struct OptStruct {
    x: Int;
    s: String;
}

contract OptionalStructField {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}