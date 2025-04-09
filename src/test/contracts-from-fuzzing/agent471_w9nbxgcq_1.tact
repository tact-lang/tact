contract SingleFieldOptional {
    data: Int?;

    init() {
        self.data = null;
    }

    receive() {
        // ensure persistence with optional
        if (self.data != null) {
            self.data = self.data!! + 1;
        } else {
            self.data = 0;
        }
    }
}