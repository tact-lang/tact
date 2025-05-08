struct L3 {
    d: Int?;
    e: Bool = true;
}

struct L2 {
    b: Int = 5;
    c: L3;
}

struct L1 {
    a: L2?;
}

contract ComplexNest {
    field: L1;

    init() {
        self.field = L1{
            a: L2{
                b: 42,
                c: L3{
                    d: null,
                    e: false
                }
            }
        };
    }
}
