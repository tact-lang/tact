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

contract DeepestNesting {
    field: Layer1;

    init() {
        self.field = Layer1{
            layer2: Layer2{
                layer3: Layer3{
                    layer4: Layer4{
                        val: 7,
                    }
                }
            }
        };
    }
}