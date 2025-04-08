contract OnlyDefaults {
    x: Int = 1;
    y: Bool = true;
    z: String = "hello";

    receive() {
        self.x = self.x + 1;
    }
}
