contract Test {
    data: String?;
    init() {
        self.data = null;
    }
    receive() {
        if (self.data != null) {
            let _ = self.data!!;
        } else {
            self.data = "hello";
        }
    }
}