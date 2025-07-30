// Same test but with optionals set to null
contract OptionalInitsNull {
    x: Int?;
    y: String?;
    z: Bool?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
    }
}
