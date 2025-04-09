struct DeeplyNested {
    layer1: Layer1;
}

struct Layer1 {
    layer2: Layer2;
}

struct Layer2 {
    layer3: Layer3;
}

struct Layer3 {
    layer4: Layer4;
}

struct Layer4 {
    val: Int;
}

contract TestContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            layer1: Layer1{
                layer2: Layer2{
                    layer3: Layer3{
                        layer4: Layer4{
                            val: 99
                        }
                    }
                }
            }
        };
    }
}