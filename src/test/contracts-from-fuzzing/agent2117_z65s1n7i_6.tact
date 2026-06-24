struct DeepOpt {
    inn: Int?;
    s: DeepOpt2?;
}

struct DeepOpt2 {
    inn2: Int?;
    s2: DeepOpt3?;
}

struct DeepOpt3 {
    inn3: Int?;
}

contract DeepOptionalNestedContract {
    nestedData: DeepOpt;
    init() {
        self.nestedData = DeepOpt{
            inn: null,
            s: DeepOpt2{
                inn2: null,
                s2: DeepOpt3{
                    inn3: null
                }
            }
        };
    }
}