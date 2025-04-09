contract OptionalIntBool {
    a: Int?;
    b: Bool?;

    init() {
        self.a = null;
        self.b = null;
    }

    receive() {
        if (self.a != null) {
            let _ = self.a!!;
        }
        if (self.b != null) {
            let _ = self.b!!;
        }
    }
}