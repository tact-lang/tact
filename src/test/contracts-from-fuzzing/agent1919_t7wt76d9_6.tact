struct OptionalNest {
    o1: Int?;
    o2: String?;
    deeper: DeeperOptional?;
}

struct DeeperOptional {
    val: String?;
}

contract TestContract {
    persistent: OptionalNest;
    init() {
        self.persistent = OptionalNest{
            o1: null,
            o2: "hello",
            deeper: DeeperOptional{val: null}
        };
    }
}