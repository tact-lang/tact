struct Tiny {
    a: Int as uint1;
    b: Int as uint4;
    c: Bool;
}

struct Container {
    optTiny: Tiny?;
    bigVal: Int as int257;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            optTiny: Tiny{a: 1, b: 15, c: true},
            bigVal: 12345678901234567890
        };
    }
}
