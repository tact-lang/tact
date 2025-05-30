struct L1 {
    a: Int;
    b: Int;
}

struct L2 {
    c: Int;
    d: Int;
    nested: L1;
}

struct L3 {
    e: Int;
    sub: L2;
}

contract NestedLayers {
    val: L3;

    init() {
        self.val = L3{
            e: 9,
            sub: L2{
                c: 7,
                d: 8,
                nested: L1{a: 5, b: 6}
            }
        };
    }
}