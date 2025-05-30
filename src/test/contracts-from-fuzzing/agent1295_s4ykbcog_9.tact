// deeply nested optional struct inside optional struct
struct DeepOpt2 {
    inner: Int?;
}

struct DeepOpt1 {
    nested: DeepOpt2?;
}

contract TestContract {
    data: DeepOpt1?;

    init() {
        self.data = DeepOpt1{
            nested: DeepOpt2{
                inner: 999
            }
        };
    }
}