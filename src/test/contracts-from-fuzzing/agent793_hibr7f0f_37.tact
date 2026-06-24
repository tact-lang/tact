struct Middle {
    i: Int;
}

struct Outer {
    m: Middle?;
}

contract OptionalMiddle {
    st: Outer;
    init() {
        self.st = Outer { m: null };
    }
}