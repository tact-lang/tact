contract MismatchAssigns {
    x: Int = 5;
    y: Bool = true;

    init() {
        self.x = 42;
        self.y = false;
    }
}
