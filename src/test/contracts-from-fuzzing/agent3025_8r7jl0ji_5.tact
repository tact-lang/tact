struct L3 {
    a: Int?;
    b: Bool;
}

struct L2 {
    nestedL3: L3;
}

struct L1 {
    nestedL2: L2?;
}

contract TestContract {
    l1field: L1;

    init() {
        self.l1field = L1{
            nestedL2: null,
        };
    }
}