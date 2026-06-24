struct OptionalNested {
    value: Int?;
    text: String?;
    flag: Bool?
}

contract OptTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            value: null,
            text: null,
            flag: null,
        };
    }
}