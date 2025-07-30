struct OptionalNested {
    x: Int;
    y: Int?;
    z: Bool?;
}

contract OptTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{x: 10, y: null, z: true};
    }
}