struct OptTest {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructFieldTest {
    data: OptTest;

    init() {
        self.data = OptTest{
            x: null,
            y: true,
            z: null
        };
    }
}
