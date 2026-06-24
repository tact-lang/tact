struct L3 {
    a: Int = 3;
    b: Int? = null;
}

struct L2 {
    x: L3 = L3{ a: 3, b: null };
    y: Bool = false;
}

struct L1 {
    left: L2 = L2{ x: L3{ a: 3, b: null }, y: false };
    right: L2 = L2{ x: L3{ a: 4, b: 5 }, y: true };
}

contract NestedDefaultsChain {
    chain: L1 = L1{
        left: L2{ x: L3{ a: 3, b: null }, y: false },
        right: L2{ x: L3{ a: 4, b: 5 }, y: true },
    };

    init() {
        // mutate if needed
    }
}