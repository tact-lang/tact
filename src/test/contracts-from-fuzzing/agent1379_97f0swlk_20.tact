struct BigNested {
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
    layer5: Layer5;
}
struct Layer5 {
    layer6: Layer6;
}
struct Layer6 {
    layer7: Layer7;
}
struct Layer7 {
    value: Int;
}

contract Inception {
    nested: BigNested;

    init() {
        self.nested = BigNested{
            layer1: Layer1{
                layer2: Layer2{
                    layer3: Layer3{
                        layer4: Layer4{
                            layer5: Layer5{
                                layer6: Layer6{
                                    layer7: Layer7{
                                        value: 777
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}
