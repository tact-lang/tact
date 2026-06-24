struct Deep3 {
    f3: Int;
}

struct Deep2 {
    f2: Deep3;
}

struct Deep1 {
    f1: Deep2;
}

contract DeepNest {
    s: Deep1;

    init() {
        self.s = Deep1{ f1: Deep2{ f2: Deep3{ f3: 100 } } };
    }
}