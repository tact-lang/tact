struct Inner {
    value: Int = 42;
}

contract OptionalStructsInit {
    structOpt: Inner?;

    init() {
        self.structOpt = null;
    }
    receive() {}
}