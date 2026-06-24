struct Inner {
    a: Int?;
}

contract OptionalStructInsideOptional {
    innerOpt: Inner?;

    init() {
        self.innerOpt = null;
    }
}