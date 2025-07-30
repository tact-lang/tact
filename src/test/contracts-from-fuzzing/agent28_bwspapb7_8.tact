contract TestContract {
    x: Int = 1;
    y: Bool = true;
    s: String = "ok";

    init() {
        self.x = 42;
        self.y = false;
        self.s = "changed";
    }
}