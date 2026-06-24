struct L2 {
    x: Int = 5;
}

struct L1 {
    inner: L2 = L2{};
}

contract TestContract {
    nested: L1;

    init() {
        self.nested = L1{};
    }
}
