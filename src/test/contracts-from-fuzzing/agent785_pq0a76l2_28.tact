contract OptionalInitNull {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;

    init() {
        self.x = 5;
        self.y = false;
        self.z = "z";
    }
}
