struct VeryDeep1 {
    a: Int;
}

struct VeryDeep2 {
    b: VeryDeep1;
}

struct VeryDeep3 {
    c: VeryDeep2;
}

struct VeryDeep4 {
    d: VeryDeep3;
}

contract NestedFourDeep {
    data: VeryDeep4;
    init() {
        self.data = VeryDeep4{
            d: VeryDeep3{
                c: VeryDeep2{
                    b: VeryDeep1{
                        a: 1234
                    }
                }
            }
        };
    }
}