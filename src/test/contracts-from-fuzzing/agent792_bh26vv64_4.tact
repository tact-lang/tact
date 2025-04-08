struct L3 {
    x: Int;
}

struct L2 {
    sub: L3;
}

struct L1 {
    sub: L2;
}

contract TestContract {
    root: L1;

    init() {
        self.root = L1{ sub: L2{ sub: L3{ x: 123 } } };
    }
}