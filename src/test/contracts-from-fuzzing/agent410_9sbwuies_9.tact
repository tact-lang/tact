struct Inner {
    z: Int as uint8;
}

struct Mid {
    middle: Inner?;
    flag: Bool;
}

contract TestContract {
    nestedOpt: Mid;

    init() {
        self.nestedOpt = Mid{
            middle: Inner{ z: 42 },
            flag: true
        };
    }
}
