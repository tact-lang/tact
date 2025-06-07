struct DeepOptInner {
    a: Int?;
}

struct DeepOptOuter {
    x: Int;
    nested: DeepOptInner?;
}

contract DeepOptTest {
    data: DeepOptOuter;

    init() {
        self.data = DeepOptOuter{
            x: 5,
            nested: null,
        };
    }
}