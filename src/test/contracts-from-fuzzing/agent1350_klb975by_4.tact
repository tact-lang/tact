struct OptionalNested {
    val: Int?;
    s: String?;
}

contract OptionalStructFields {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            val: null,
            s: null
        };
    }
}