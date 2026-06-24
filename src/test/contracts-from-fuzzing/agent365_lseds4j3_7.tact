struct OptionalNested {
    val: Int?;
    label: String;
}

contract OptionalInnerField {
    inner: OptionalNested;

    init() {
        self.inner = OptionalNested{
            val: null,
            label: "optional test"
        };
    }
}