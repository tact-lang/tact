struct Inner {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    innerOpt: Inner?;

    init() {
        self.innerOpt = null;
    }
}