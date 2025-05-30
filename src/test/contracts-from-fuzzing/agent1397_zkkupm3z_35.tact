contract LateAssign {
    x: Int;
    y: Bool;

    init() {
        self.x = 10;
        self.y = true;
        self.x = 20;
        self.y = false;
    }
}