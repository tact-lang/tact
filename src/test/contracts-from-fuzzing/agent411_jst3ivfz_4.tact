struct DeepOptional {
    innerOpt: Inner?;
}

struct Inner {
    val: Int?;
}

contract DeepOptContract {
    dopt: DeepOptional;

    init() {
        self.dopt = DeepOptional{
            innerOpt: null
        };
    }
}