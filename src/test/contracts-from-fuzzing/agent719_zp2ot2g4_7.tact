struct InnerInner {
    val: Int?;
}

struct Inner {
    nestedOpt: InnerInner?;
    flag: Bool?;
}

contract TestContract {
    state: Inner;
    init() {
        self.state = Inner{
            nestedOpt: null,
            flag: null
        };
    }
}