struct VeryDeep {
    a: Int;
    b: Int;
}

struct Layer1 {
    d: VeryDeep;
}

struct Layer2 {
    d: Layer1;
}

struct Layer3 {
    d: Layer2;
}

struct Layer4 {
    d: Layer3;
}

struct Layer5 {
    d: Layer4;
}

contract FiveLayers {
    nested: Layer5;

    init() {
        self.nested = Layer5{
            d: Layer4{
                d: Layer3{
                    d: Layer2{
                        d: Layer1{
                            d: VeryDeep{
                                a: 1,
                                b: 2
                            }
                        }
                    }
                }
            }
        };
    }
}