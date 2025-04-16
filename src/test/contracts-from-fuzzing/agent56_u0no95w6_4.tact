struct OptionalNested {
    val: Int?;
    label: String;
}

contract OptionalStructField {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            val: null,
            label: "test",
        };
    }
}