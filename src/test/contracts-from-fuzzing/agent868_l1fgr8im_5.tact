struct OptionalNest {
    sub: Inner?;
}

struct Inner {
    value: Int as uint16;
    flag: Bool;
}

contract TestContract {
    opt: OptionalNest = OptionalNest{ sub: null };

    init() {
        self.opt = OptionalNest{
            sub: Inner{
                value: 256,
                flag: true
            }
        };
    }

    receive() {
        // dummy
    }
}