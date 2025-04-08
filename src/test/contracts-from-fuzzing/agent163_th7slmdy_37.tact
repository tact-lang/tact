struct Layer1 {
    val: Int;
}

struct Layer2 {
    layer1: Layer1;
}

struct Layer3 {
    layer2: Layer2;
}

struct Layer4 {
    layer3: Layer3;
}

contract FourLayers {
    s: Layer4;
    init() {
        self.s = Layer4{
            layer3: Layer3{
                layer2: Layer2{
                    layer1: Layer1{ val:42 }
                }
            }
        };
    }
}