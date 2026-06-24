struct OptionalStructField {
    x: Int;
    y: Bool?;
}

contract OptStruct {
    data: OptionalStructField?;

    init() {
        self.data = null;
    }
}