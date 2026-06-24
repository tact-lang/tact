contract OptString {
    meta: String?;

    init() {
        self.meta = null;
    }

    receive() {
        self.meta = "Hello optional string";
    }
}