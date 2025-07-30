contract OnlyOneOptionalInInit {
    number: Int;
    text: String?;

    init() {
        self.number = 999;
        self.text = null;
    }
}