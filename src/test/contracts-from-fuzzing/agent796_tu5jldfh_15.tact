// Deep nesting with default fields on inner
struct L1 {
    l2: L2;
}

struct L2 {
    l3: L3;
}

struct L3 {
    a: Int = 7;
    b: Bool = false;
}

contract TestContract {
    val: L1;

    init() {
        self.val = L1{ l2: L2{ l3: L3{} } };
    }
}