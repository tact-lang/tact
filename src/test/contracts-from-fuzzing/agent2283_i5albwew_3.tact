struct OptionalLayer {
    num: Int?;
    text: String?;
    address: Address?;
}

contract OptionalFieldsContract {
    info: OptionalLayer;

    init() {
        self.info = OptionalLayer{
            num: null,
            text: null,
            address: null,
        };
    }
}
