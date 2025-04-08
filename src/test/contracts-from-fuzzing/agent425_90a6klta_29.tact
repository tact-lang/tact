// Persistent nested tuple-like struct
struct TupleLike {
    a: Int; b: Int; c: Int;
}

struct Wrap {
    t: TupleLike;
}

contract TestContract {
    s: Wrap;

    init() {
        self.s = Wrap{ t: TupleLike{ a:1, b:2, c:3 } };
    }
}