// test optional of struct with an optional struct nested field
struct Inner {
    a: Int;
}

struct Mid {
    inr: Inner?;
}

contract OptOptNest {
    mid: Mid?;

    init() {
        self.mid = null;
    }
}