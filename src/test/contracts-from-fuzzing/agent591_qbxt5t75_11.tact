struct InnerX {
    alpha: Int;
    beta: String;
}

struct NestedOptionDepthTwo {
    innerOpt: InnerX?;
}

contract NestedOptionTest {
    storage: NestedOptionDepthTwo;
    init() {
        self.storage = NestedOptionDepthTwo{
            innerOpt: InnerX{
                alpha: 42,
                beta: "beta"
            }
        };
    }
}