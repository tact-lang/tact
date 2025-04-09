struct Leaf {
    v: Int;
}

struct Mid {
    l: Leaf?;
}

struct Top {
    m: Mid?;
}

contract TestContract {
    t: Top;

    init() {
        self.t = Top{ m: null };
    }
}