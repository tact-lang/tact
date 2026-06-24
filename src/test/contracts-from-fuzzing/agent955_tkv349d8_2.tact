struct ManyOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFieldsTest {
    optData: ManyOptionals;

    init() {
        self.optData = ManyOptionals{
            x: null,
            y: null,
            z: null,
        };
    }
}