struct OptTest {
    x: Int?;
    y: Int?;
    z: Int?;
}

contract OptionalFields {
    opt: OptTest;

    init() {
        self.opt = OptTest{ x: null, y: null, z: 10 };
    }
}