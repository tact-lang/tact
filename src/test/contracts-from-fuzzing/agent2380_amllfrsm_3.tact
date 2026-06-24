struct Deep3 {
    val: Int;
}

struct Deep2 {
    inner: Deep3;
}

struct Deep1 {
    inner: Deep2;
}

contract TestContract {
    chain: Deep1;
    init() {
        self.chain = Deep1{ inner: Deep2{ inner: Deep3{ val: 100 } } };
    }
}