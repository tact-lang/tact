struct L2 { flag: Bool }
struct L1 { l2: L2 }

contract DeepNested {
    inner: L1;

    init() {
        self.inner = L1{ l2: L2{ flag: true } };
    }
}