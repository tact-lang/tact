struct MoreLayers {
    l1: Layer1;
}

struct Layer1 {
    l2: Layer2;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer3 {
    l4: Layer4;
}

struct Layer4 {
    value: Int;
}

contract Layers5 {
    data: MoreLayers;

    init() {
        self.data = MoreLayers{
            l1: Layer1{
                l2: Layer2{
                    l3: Layer3{
                        l4: Layer4{ value: 1234 }
                    }
                }
            }
        };
    }
}