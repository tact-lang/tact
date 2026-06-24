struct InnerMost {
    flag: Bool?;
    number: Int?;
}

struct Middle {
    sub1: InnerMost;
    sub2: InnerMost?;
}

struct Outer {
    embed: Middle?;
}

contract OptNest {
    val: Outer;
    init() {
        self.val = Outer{ embed: null };
    }
}