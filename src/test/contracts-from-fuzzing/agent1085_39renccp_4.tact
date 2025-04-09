struct OptionalNested {
    flag: Bool;
    number: Int?;
    text: String?;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            flag: true,
            number: null,
            text: null
        };
    }
}