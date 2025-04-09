// nested optionals at multiple struct levels
struct DeepOpt2 {
    innerOpt: Int?;
}

struct DeepOpt1 {
    lvl2: DeepOpt2?;
}

contract MultiNestedOptionals {
    root: DeepOpt1?;

    init() {
        self.root = null;
    }
}
