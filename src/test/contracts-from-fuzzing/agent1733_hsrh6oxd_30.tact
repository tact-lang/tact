struct DeepOpt1 {
    x: Int?;
}

struct DeepOpt2 {
    inner: DeepOpt1?;
}

contract TestContract {
    d: DeepOpt2;

    init() {
        self.d = DeepOpt2{
            inner: null
        };
    }
}