struct Deep3 {
    num: Int;
}

struct Deep2 {
    inner: Deep3;
}

struct Deep1 {
    inner: Deep2;
}

contract Test {
    d: Deep1;
    init() {
        self.d = Deep1{ inner: Deep2{ inner: Deep3{ num: 7 } } };
    }
}