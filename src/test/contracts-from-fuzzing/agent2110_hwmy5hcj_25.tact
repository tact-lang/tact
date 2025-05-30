// Deepest nested explicit initialization with mixed optionals
struct L3 {
    p: Int?;
}

struct L2 {
    c: Cell;
    l3: L3?;
}

struct L1 {
    l2: L2?;
}

contract DeepMix {
    d: L1;
    init() {
        self.d = L1{
            l2: L2{
                c: emptyCell(),
                l3: L3{p: null}
            }
        };
    }
}