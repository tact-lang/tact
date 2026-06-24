struct OptStruct {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalStructField {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}