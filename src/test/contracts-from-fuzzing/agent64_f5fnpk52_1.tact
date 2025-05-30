contract SingleIntField {
    x: Int;

    init() {
        self.x = 1;
    }

    receive() {
        self.x = self.x + 1;
    }
}