struct OptionalDeeper {
    deep: DeepOptional?;
}

struct DeepOptional {
    value: Int?;
}

contract TestContract {
    param: OptionalDeeper;
    
    init() {
        self.param = OptionalDeeper {
            deep: DeepOptional {
                value: null
            }
        };
    }
}