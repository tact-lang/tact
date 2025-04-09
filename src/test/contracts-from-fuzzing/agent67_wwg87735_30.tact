// Nested struct with many optional fields of different types
struct DeepNestOpt {
    i: Int?;
    b: Bool?;
    s: String?;
}

struct UpperDeepOpt {
    d1: DeepNestOpt?;
    d2: DeepNestOpt?;
    flag: Bool;
}

contract NestedOptionCluster {
    val: UpperDeepOpt;

    init() {
        self.val = UpperDeepOpt{
            d1: DeepNestOpt{
                i: null,
                b: true,
                s: null
            },
            d2: null,
            flag: false
        };
    }
}
