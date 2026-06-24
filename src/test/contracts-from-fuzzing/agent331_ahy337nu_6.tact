struct Inner {
    x: Int?;
    y: Bool;
}

struct Outer {
    first: Inner;
    flag: Bool;
}

contract DeepOptional {
    opt: Outer?;

    init() {
        self.opt = null;
    }
}