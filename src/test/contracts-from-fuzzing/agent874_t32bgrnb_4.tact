struct OptionalTest {
    x: Int?;
    y: Bool?;
    z: Cell?;
}

contract OptStructPersist {
    data: OptionalTest;

    init() {
        self.data = OptionalTest{
            x: null,
            y: true,
            z: null
        };
    }
}