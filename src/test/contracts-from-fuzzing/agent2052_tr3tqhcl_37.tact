contract NestedLayerOptionals {
    a: L1;

    init() {
        self.a = L1{
            b: L2{
                c: null,
                d: L3{
                    e: null
                }
            }
        };
    }
}

struct L1 {
    b: L2;
}

struct L2 {
    c: String?;
    d: L3;
}

struct L3 {
    e: Bool?;
}