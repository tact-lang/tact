struct InnerMost {
    flag: Bool;
}

struct Mid {
    inside: InnerMost;
}

contract OptionalMid {
    m: Mid?;

    init() {
        self.m = null;
    }
}