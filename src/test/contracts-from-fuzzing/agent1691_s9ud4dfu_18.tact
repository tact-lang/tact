struct OptionalBools {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
}

contract OptionalBoolsTest {
    data: OptionalBools;

    init() {
        self.data = OptionalBools{
            b1: null,
            b2: null,
            b3: null
        };
    }
}