struct OptionalInner {
    num: Int?;
    flag: Bool?;
    text: String?;
}

contract TestContract {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{
            num: null,
            flag: null,
            text: null,
        };
    }
}
