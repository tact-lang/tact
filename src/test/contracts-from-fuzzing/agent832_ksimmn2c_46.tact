contract OptAssignNullReset {
    x: Int? = null;

    init() {
        self.x = 123;
        self.x = null;
    }
}