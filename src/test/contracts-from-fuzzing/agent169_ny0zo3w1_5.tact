struct Deep1 {
    num: Int;
}

struct Deep2 {
    d1: Deep1;
}

struct Deep3 {
    d2: Deep2;
}

contract TestContract {
    deep: Deep3;

    init() {
        self.deep = Deep3{ d2: Deep2{ d1: Deep1{ num: 7 } } };
    }
}