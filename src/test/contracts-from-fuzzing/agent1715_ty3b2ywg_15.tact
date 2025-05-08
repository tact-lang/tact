struct BigNesting {
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
    val: Int;
}

contract TestContract {
    x: BigNesting = BigNesting{
        layer1: Layer1{
            layer2: Layer2{
                layer3: Layer3{
                    layer4: Layer4{
                        layer5: Layer5{
                            val: 777
                        }
                    }
                }
            }
        }
    };
}