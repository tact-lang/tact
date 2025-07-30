struct Link1 {
    num: Int;
}

struct Link2 {
    l1: Link1;
}

struct Link3 {
    l2: Link2;
}

struct Link4 {
    l3: Link3;
}

struct Link5 {
    l4: Link4;
}

contract DeepChain5 {
    x: Link5;

    init() {
        self.x = Link5{
            l4: Link4{
                l3: Link3{
                    l2: Link2{
                        l1: Link1{ num:77 }
                    }
                }
            }
        };
    }
}