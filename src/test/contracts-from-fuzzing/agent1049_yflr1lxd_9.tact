struct OptStruct {
    x: Int;
    y: String?;
}

contract OptionalStructField {
    data: OptStruct?;

    init() {
        self.data = OptStruct{ x: 42, y: null };
    }
}