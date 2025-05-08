struct Sub {
    a: Int;
}

struct Mid {
    s: Sub;
}

struct Top {
    m: Mid;
}

contract MixedNested {
    val: Int;
    opt: Top?;

    init() {
        self.val = 123;
        self.opt = null;
    }
}