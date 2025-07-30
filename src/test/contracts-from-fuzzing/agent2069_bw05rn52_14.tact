struct Outer {
    innerOpt: Inner?;
    flag: Bool;
}

struct Inner {
    value: Int?;
}

contract C {
    data: Outer;
    init() {
        self.data = Outer{innerOpt: null, flag: true};
    }
}