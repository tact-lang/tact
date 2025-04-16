struct InnerText {
    s: String;
}

contract OptionalString {
    val: InnerText?;

    init() {
        self.val = null;
    }
}