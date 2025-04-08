struct OptNest {
    val: Int?;
    other: Bool?;
    deeper: DeepOpt?;
}

struct DeepOpt {
    flag: Bool;
    innerVal: Int;
}

contract TestContract {
    data: OptNest;

    init() {
        self.data = OptNest{
            val: null,
            other: null,
            deeper: null,
        };
    }
}