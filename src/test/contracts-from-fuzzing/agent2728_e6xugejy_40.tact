trait T {
    x: Int?;
}

contract C with T {
    x: Int?;
    y: String?;

    init() {
        self.x = null;
        self.y = null;
    }
}
