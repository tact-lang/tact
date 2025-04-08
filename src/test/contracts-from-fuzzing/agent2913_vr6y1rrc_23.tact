struct DeepOpt {
    a: Int?;
}

struct DeepNestOpt2 {
    b: DeepOpt?;
}

contract NestedOptionalStructField {
    f: DeepNestOpt2;
    
    init() {
        self.f = DeepNestOpt2{
            b: null,
        };
    }
}