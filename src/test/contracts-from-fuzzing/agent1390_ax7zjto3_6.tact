struct BigNested {
    inner1: Int;
    inner2: Int;
    sub: SmallNested;
}

struct SmallNested {
    a: Int;
    b: Int;
}

contract MultiNested {
    big: BigNested;
    small: SmallNested;

    init() {
        self.small = SmallNested{a:1,b:2};
        self.big = BigNested{inner1:3, inner2:4, sub:self.small};
    }
}