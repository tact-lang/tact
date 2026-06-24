struct OptionalStructField {
    a: Int;
    b: Bool;
}

contract OptionalStructInField {
    data: OptionalStructField?;

    init() {
        self.data = OptionalStructField{
            a: 1,
            b: true,
        };
    }
}