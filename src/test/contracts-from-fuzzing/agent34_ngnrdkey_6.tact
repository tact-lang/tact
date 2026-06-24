struct L1 {
    a: Int;
}

struct L2 {
    l1: L1;
    b: Int;
}

struct L3 {
    l2: L2;
    c: Int;
}

struct L4 {
    l3: L3;
    d: Int;
}

struct L5 {
    l4: L4;
    e: Int;
}

contract DeepChainTest {
    receive() {
        let l1 = L1{ a: 1 };
        let l2 = L2{ l1: l1, b: 2 };
        let l3 = L3{ l2: l2, c: 3 };
        let l4 = L4{ l3: l3, d: 4 };
        let l5 = L5{ l4: l4, e: 5 };
    }
}
