struct OptNested {
    value: Int?;
    label: String?;
}

contract OptionalStructField {
    data: OptNested;

    init() {
        self.data = OptNested{
            value: null,
            label: null,
        };
    }
}