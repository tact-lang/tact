struct In1 { a: Int; }
struct In2 { b: Bool; }

struct Wrapper {
    p1: Int?;
    p2: Bool?;
    s1: In1?;
    s2: In2?;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            p1: null,
            p2: true,
            s1: null,
            s2: In2{ b: false }
        };
    }
}