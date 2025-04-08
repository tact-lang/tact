contract OptionalDefaultsInit {
    x: Int?;
    y: Bool?;

    init() {
        self.x = null;  // explicit null assignment
        self.y = true;
    }
}
