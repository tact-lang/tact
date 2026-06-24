contract OptPersistentTest {
    optInt: Int?;
    optBool: Bool?;
    init() {
        self.optInt = null;
        self.optBool = null;
    }
    receive() {
        if (self.optInt != null) {
            let _ = self.optInt!!;
        }
        if (self.optBool != null) {
            let _ = self.optBool!!;
        }
    }
}