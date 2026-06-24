struct VeryDeep4 {
    a: Int;
}

struct VeryDeep3 {
    d4: VeryDeep4;
}

struct VeryDeep2 {
    d3: VeryDeep3;
}

struct VeryDeep1 {
    d2: VeryDeep2;
}

contract DeepStructTest {
    s: VeryDeep1;

    init() {
        self.s = VeryDeep1{
            d2: VeryDeep2{
                d3: VeryDeep3{
                    d4: VeryDeep4{
                        a: 33
                    }
                }
            }
        };
    }
}