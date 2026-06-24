struct Inner {
    x: Int;
}

contract ThreeOptions {
    a: Int?;
    b: Bool?;
    innerOpt: Inner?;

    init() {
        self.a = 1;
        self.b = null;
        self.innerOpt = Inner{x: 3};
    }
}
