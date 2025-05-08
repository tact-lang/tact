// Optional struct holding struct with optional field deep inside
struct DeepOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract NestedOptionalsInside {
    data: DeepOpt;

    init() {
        self.data = DeepOpt{ inner: null };
    }
}