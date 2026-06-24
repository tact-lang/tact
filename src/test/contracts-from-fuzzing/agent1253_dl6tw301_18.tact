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
        self.opt = OuterOpt{ innerOpt: null, z: 55 };
    }

    receive() {}
}