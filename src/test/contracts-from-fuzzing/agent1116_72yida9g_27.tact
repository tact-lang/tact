// Same struct used multiple times, nested
struct Reused {
    q: Int;
}

struct Container {
    r1: Reused;
    r2: Reused;
}

contract MultiUse {
    a: Container;

    init() {
        self.a = Container{
            r1: Reused{ q:5 },
            r2: Reused{ q:6 }
        };
    }
}
