struct OptionalNested {
    number: Int;
    text: String?;
}

contract OptFieldContract {
    storage: OptionalNested?;

    init() {
        self.storage = OptionalNested{
            number: 5,
            text: "testing",
        };
    }
}