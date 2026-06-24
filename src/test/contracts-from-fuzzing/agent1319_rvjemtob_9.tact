struct DeepOptionalNested {
    x: Int?;
    y: Bool?;
}

struct WithOptionalStruct {
    inner: DeepOptionalNested?;
    z: Int;
}

contract OptionalNestedFieldTest {
    data: WithOptionalStruct;

    init() {
        self.data = WithOptionalStruct {
            inner: null,
            z: 7
        };
    }
}