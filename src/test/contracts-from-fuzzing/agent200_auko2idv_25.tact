struct OptionalStructField {
    amount: Int as uint64;
    comment: String?;
}

contract OptStructField {
    payload: OptionalStructField;
    init() {
        self.payload = OptionalStructField{
            amount: 12345,
            comment: null
        };
    }
}