struct OptionalDeep {
    field1: Int?;
    field2: InnerDeep?;
}

struct InnerDeep {
    field3: Int?;
    field4: InnerMost?;
}

struct InnerMost {
    val: Int?;
}

contract OptionalDeepTest {
    data: OptionalDeep;
    init() {
        self.data = OptionalDeep{
            field1: null,
            field2: null // keep optional null
        };
    }
}
