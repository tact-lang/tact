struct Mid {
    i: Int;
}

struct Top {
    m: Mid;
    opt: String?;
}

contract TestContract {
    t: Top;

    init() {
        self.t = Top{ m: Mid{ i: 5 }, opt: null };
    }
}