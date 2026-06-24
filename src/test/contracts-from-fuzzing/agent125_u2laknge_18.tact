// deeply nested optionals combined
struct DeepOpt1 { inner: DeepOpt2?; }
struct DeepOpt2 { inner: DeepOpt3?; }
struct DeepOpt3 { value: Int?; }

contract DeepOptNest {
    data: DeepOpt1;

    init() {
        self.data = DeepOpt1{
            inner: DeepOpt2{
                inner: DeepOpt3{
                    value: null,
                }
            }
        };
    }
}