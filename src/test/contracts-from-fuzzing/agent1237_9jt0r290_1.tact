contract SingleIntField {
    x: Int = 0;
    init() {
        self.x = 42;
    }
    receive() {
        self.x = self.x + 1;
    }
}