struct OptionalInner {
    flag: Bool?;
    comment: String?;
    amount: Int?;
}

contract BigOptionals {
    inner: OptionalInner;
    text: String?;
    counted: Int?;
    switcher: Bool?;

    init() {
        self.inner = OptionalInner{ flag: null, comment: null, amount: null };
        self.text = null;
        self.counted = null;
        self.switcher = null;
    }
}