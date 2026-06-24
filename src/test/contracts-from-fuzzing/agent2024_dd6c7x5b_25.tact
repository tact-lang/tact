struct L1 {
    a: Int;
    b: Bool;
}

struct L2 {
    c: L1;
    d: Int?;
}

contract NestedMixed {
    data: L2;

    init() {
        self.data = L2{
            c: L1{
                a: 5,
                b: false
            },
            d: null
        };
    }
}