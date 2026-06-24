struct DeepOpt1 {
    a: Int?;
}

struct DeepOpt2 {
    b: DeepOpt1?;
}

contract NestedOptionalField {
    s: DeepOpt2;

    init() {
        self.s = DeepOpt2{
            b: null
        };
    }
}