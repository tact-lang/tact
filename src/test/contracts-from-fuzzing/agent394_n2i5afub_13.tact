struct Deep1 {
    val: Int = 1;
}

struct Deep2 {
    sub: Deep1;
}

struct Deep3 {
    sub: Deep2;
}

contract TestContract {
    d: Deep3;

    init() {
        self.d = Deep3{ sub: Deep2{ sub: Deep1{ val: 42 } } };
    }
}