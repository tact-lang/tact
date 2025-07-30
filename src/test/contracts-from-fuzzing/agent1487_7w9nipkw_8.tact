struct One { a: Int; }
struct Two { b: Int; }
struct Three { c: Int; }

struct Container {
    o: One;
    t: Two;
    thr: Three;
}

contract MultStructs {
    state: Container;

    init() {
        self.state = Container{
            o: One{ a: 1 },
            t: Two{ b: 2 },
            thr: Three{ c: 3 }
        };
    }
}