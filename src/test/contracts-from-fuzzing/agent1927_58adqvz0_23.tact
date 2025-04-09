struct VeryDeep {
    a: Int;
}

struct L2 {
    d: VeryDeep;
}

struct L1 {
    l: L2;
}

contract ManyLayers {
    val: L1;

    init() {
        self.val = L1{ l: L2{ d: VeryDeep{ a:1 } } };
    }
}