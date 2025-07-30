struct Layer4 {
    n: Int;
}

struct Layer3 {
    l4: Layer4;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer1 {
    l2: Layer2;
}

contract FourLayers {
    root: Layer1;

    init() {
        self.root = Layer1{
            l2: Layer2{
                l3: Layer3{
                    l4: Layer4{
                        n: 999,
                    }
                }
            }
        };
    }
}
