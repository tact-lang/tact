struct DeepNullable {
    value: Int?;
}

struct Layered {
    nested: DeepNullable?;
}

contract NullableLayer {
    data: Layered;
    init() {
        self.data = Layered{
            nested: null
        };
    }
}