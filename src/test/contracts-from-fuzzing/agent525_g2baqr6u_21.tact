// fix previous assignment syntax
struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    innerOpt: Inner?;
    comment: String?;
}

contract Test {
    f: Outer?;
    init() {
        self.f = null;
    }
}