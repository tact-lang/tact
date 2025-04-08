struct InnerMost {
    x: Bool;
}

struct L2 {
    inner: InnerMost;
}

struct L3 {
    nested: L2;
}

contract StructTower {
    state: L3;

    init() {
        self.state = L3{
            nested: L2{
                inner: InnerMost{ x: true },
            },
        };
    }
}