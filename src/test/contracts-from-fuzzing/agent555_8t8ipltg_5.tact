struct LayerOne {
    x: Int;
}

struct LayerTwo {
    l1: LayerOne;
}

struct LayerThree {
    l2: LayerTwo;
}

struct LayerFour {
    l3: LayerThree;
}

struct LayerFive {
    l4: LayerFour;
}

contract ManyLayers {
    nested: LayerFive;

    init() {
        self.nested = LayerFive{
            l4: LayerFour{
                l3: LayerThree{
                    l2: LayerTwo{
                        l1: LayerOne{
                            x: 42
                        }
                    }
                }
            }
        };
    }
}