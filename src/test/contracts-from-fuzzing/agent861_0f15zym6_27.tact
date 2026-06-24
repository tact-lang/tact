contract OptionalDirect {
    val: Int?;
    text: String = "hi";

    init() {
        self.val = null;
    }

    receive() {
        let _ = self.val;
        let _ = self.text;
    }
}