struct SOpt {
    a: Int?;
    b: Bool?;
}

contract OptionalStructField {
    data: SOpt? = null;

    init() {
        self.data = null;
    }
}