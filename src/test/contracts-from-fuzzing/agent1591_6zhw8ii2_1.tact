contract SingleBool {
    active: Bool;

    init() {
        self.active = true;
    }

    receive() {
        self.active = !self.active;
    }
}