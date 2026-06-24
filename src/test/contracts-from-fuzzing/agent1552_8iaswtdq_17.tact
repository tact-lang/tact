struct Tiny {
    x: Int;
}

struct Larger {
    a: Tiny;
    b: Tiny;
    c: Tiny;
    d: Tiny;
}

contract TinyMany {
    storage: Larger;

    init() {
        self.storage = Larger{
            a:Tiny{x:1},
            b:Tiny{x:2},
            c:Tiny{x:3},
            d:Tiny{x:4}
        };
    }
}