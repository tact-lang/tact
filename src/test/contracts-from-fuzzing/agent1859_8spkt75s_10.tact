struct OptionalDeep {
    nested: Inner?;
}

struct Inner {
    nested2: Inner2?;
}

struct Inner2 {
    value: Int?;
}

contract DeepOptionalTest {
    data: OptionalDeep;
    init() {
        self.data = OptionalDeep{
            nested: Inner{
                nested2: Inner2{
                    value: 55
                }
            }
        };
    }
}