contract NullableEdge {
    x: Int?;
    y: Bool?;
    z: String?;

    init() {
        self.x = -123;
        self.y = true;
        self.z = "check";
    }
}