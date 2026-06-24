struct Inner {
    x: Int;
    y: String;
}

struct Middle {
    innerOpt: Inner?;
    num: Int;
}

contract OptionalNest {
    m: Middle?;

    init() {
        self.m = null;
    }
}