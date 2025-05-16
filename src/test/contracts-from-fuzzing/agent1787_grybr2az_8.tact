struct OptionalPrimitives {
    flag: Bool?;
    count: Int?;
    text: String?;
}

contract OptionalPrimitivesTest {
    data: OptionalPrimitives;

    init() {
        self.data = OptionalPrimitives{
            flag: null,
            count: null,
            text: null
        };
    }
}