struct InnerMost {
    x: Int as uint8;
    y: Bool = false;
}

struct InnerOpt {
    val: InnerMost?;
}

struct Middle {
    innerOpt: InnerOpt;
    flag: Bool;
}

struct Outer {
    middle: Middle?;
    count: Int = 5;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: null,
            count: 42
        };
    }
}