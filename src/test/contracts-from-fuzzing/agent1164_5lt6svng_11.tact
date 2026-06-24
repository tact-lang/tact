contract InlineInit {
    x: Int;
    y: Int;

    init() {
        self.x = 5;
        self.y = self.x + 3;
    }
}