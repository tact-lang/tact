struct OptionalFields {
    num: Int?;
    flag: Bool?;
    text: String?;
}

contract OptionContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            num: null,
            flag: true,
            text: null
        };
    }
}