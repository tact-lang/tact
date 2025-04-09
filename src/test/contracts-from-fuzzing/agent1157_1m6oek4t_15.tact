contract OptStringFieldTest {
    message: String?;

    init() {
        self.message = null;
    }

    receive() {
        let tmp = self.message;
    }
}