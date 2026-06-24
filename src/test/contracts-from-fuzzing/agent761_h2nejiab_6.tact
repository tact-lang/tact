contract OptionalFieldsTest {
    x: Int?;
    y: Bool?;
    z: Address?;

    init() {
        self.x = 123;
        self.y = null;
        self.z = null;
    }
}
