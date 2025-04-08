struct InnerMost {
    flag: Bool;
}

struct Mid {
    inner: InnerMost?;
}

struct Top {
    left: Mid;
    right: Mid;
    maybeMiddle: Mid?;
}

contract Test {
    storage: Top;

    init() {
        self.storage = Top{
            left: Mid{inner: null},
            right: Mid{inner: InnerMost{flag:true}},
            maybeMiddle: null
        };
    }
}
