struct DeepOptional {
    level1: InnerOpt?;
}

struct InnerOpt {
    val: Int;
}

contract TestContract {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            level1: InnerOpt{ val: 77 },
        };
    }
}
