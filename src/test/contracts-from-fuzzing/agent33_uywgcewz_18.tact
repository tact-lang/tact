contract BoolAndOptionalFields {
    x: Bool;
    y: Bool?;
    z: Bool;

    init() {
        self.x = true;
        self.y = null;
        self.z = false;
    }
}