struct OptionalInner {
    text: String?;
    number: Int?;
}

contract OptionalStructFieldContract {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{
            text: null,
            number: null,
        };
    }
}