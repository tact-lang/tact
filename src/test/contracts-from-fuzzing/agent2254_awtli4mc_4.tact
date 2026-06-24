struct Deep3 {
    val: Int;
}

struct Deep2 {
    next: Deep3;
}

struct Deep1 {
    next: Deep2;
}

contract TestContract {
    chain: Deep1;

    init() {
        self.chain = Deep1{ next: Deep2{ next: Deep3{ val: 123 } } };
    }
}