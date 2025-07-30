contract ContradictDefaultInit {
    x: Int = 5;
    y: Bool;

    init() {
        self.x = 10;
        self.y = true;
    }
}
