struct OptionalInner {
    val: Int = 5;
    text: String?;
}

contract OptStructField {
    data: OptionalInner?;

    init() {
        self.data = OptionalInner{ val: 42, text: null };
    }

    receive() {
        if (self.data != null) {
            let _ = self.data!!.val;
        }
    }
}