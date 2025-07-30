message MyMsg {}

struct Inner {
    m: MyMsg?;
}

contract TestContract {
    innerOpt: Inner?;
    init() {
        self.innerOpt = Inner{ m: MyMsg{} };
    }
}