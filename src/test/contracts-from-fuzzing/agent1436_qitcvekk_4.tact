struct OptionalNested {
    data: Int?;
    flag: Bool?;
    text: String?;
}

contract TestContract {
    optionalData: OptionalNested;

    init() {
        self.optionalData = OptionalNested{
            data: null,
            flag: true,
            text: null
        };
    }
}