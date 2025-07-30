struct OptionalNesting {
    layer1: Layer1?;
}

struct Layer1 {
    layer2: Layer2?;
}

struct Layer2 {
    num: Int?;
    flag: Bool?;
}

contract TestContract {
    nestedOpt: OptionalNesting;
    init() {
        self.nestedOpt = OptionalNesting{
            layer1: Layer1{
                layer2: Layer2{
                    num: null,
                    flag: true
                }
            }
        };
    }
}