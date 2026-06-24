struct Inner {
    i: Int?;
}

contract OptionalChain {
    a: Inner?;

    init() {
        self.a = Inner{i: null};
    }
}