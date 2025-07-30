struct Inner {
    y: Int;
}

struct OuterOpt {
    innerOpt: Inner?;
    z: Int;
}

contract DoubleOptFields {
    opt: OuterOpt?;

    init() {
        self.opt = null;
    }

    receive() {}
}