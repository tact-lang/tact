struct OptionalNested {
    innerData: Int?;
}

struct OptionalOuter {
    nestedData: OptionalNested?;
}

contract OptionalStructTest {
    value: OptionalOuter;
    init() {
        self.value = OptionalOuter{
            nestedData: null
        };
    }
}
