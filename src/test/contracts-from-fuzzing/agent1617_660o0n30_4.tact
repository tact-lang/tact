struct OptionalNest {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFieldsTest {
    o: OptionalNest;

    init() {
        self.o = OptionalNest{
            x: null,
            y: true,
            z: "hey"
        };
    }
}
