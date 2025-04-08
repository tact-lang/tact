struct Inner {
    x: Int;
}

struct Middle {
    inOpt: Inner?;
    y: Bool;
}

contract TestContract {
    m: Middle;

    init() {
        self.m = Middle{
            inOpt: null,
            y: true
        };
    }
}