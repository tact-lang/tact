struct Layer3 {
    val: Int;
}

struct Layer2 {
    layer3: Layer3;
}

struct Layer1 {
    layer2: Layer2;
}

struct Layer0 {
    layer1: Layer1;
}

contract UltraDeep {
    data: Layer0;

    init() {
        self.data = Layer0{
            layer1: Layer1{
                layer2: Layer2{
                    layer3: Layer3{
                        val: 999
                    }
                }
            }
        };
    }
}