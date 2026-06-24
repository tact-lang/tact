contract OptionalAssignLater {
    data: Int?;

    init() {
        self.data = null;
    }

    receive() {
        self.data = 123;
    }
}