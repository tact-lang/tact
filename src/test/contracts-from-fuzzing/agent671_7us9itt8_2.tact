struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    innerOpt: InnerOpt;

    init() {
        self.innerOpt = InnerOpt{ a: null, b: true };
    }
}