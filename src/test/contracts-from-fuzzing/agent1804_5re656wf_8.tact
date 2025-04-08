struct Deep1 {
    v: Int;
}

struct Deep2 {
    x: Deep1;
}

struct Deep3 {
    y: Deep2;
}

contract UltraDeep {
    s: Deep3;

    init() {
        self.s = Deep3{ y: Deep2{ x: Deep1{ v: 123 } } };
    }
}