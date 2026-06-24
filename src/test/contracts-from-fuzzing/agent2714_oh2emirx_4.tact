struct OptionalInner {
    flag: Bool?;
    text: String?;
}

contract Test4 {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{ flag: null, text: null };
    }
}