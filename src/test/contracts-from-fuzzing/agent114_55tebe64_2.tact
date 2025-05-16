struct OptionalNest {
    x: Int?;
    y: Bool;
    z: Int?;
}

contract OptionalFieldTest {
    nested: OptionalNest;

    init() {
        self.nested = OptionalNest{
            x: null,
            y: true,
            z: 10,
        };
    }
}