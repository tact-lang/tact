struct Inner {
    one: Int;
    two: Bool?;
    three: String;
}

struct Middle {
    m1: Inner;
    m2: Inner;
}

contract OptionalNested {
    opt: Middle?;

    init() {
        self.opt = null;
    }
}