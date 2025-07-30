struct OptStruct {
    x: Int;
    y: String;
}

contract OptionalStructField {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}
