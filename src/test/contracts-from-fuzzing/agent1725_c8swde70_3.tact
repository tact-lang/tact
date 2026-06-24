struct OptionalInner {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFieldsTest {
    info: OptionalInner;

    init() {
        self.info = OptionalInner{ x: null, y: null, z: null };
    }
}