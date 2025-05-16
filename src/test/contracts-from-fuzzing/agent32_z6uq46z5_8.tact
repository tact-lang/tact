struct ComplexNested {
    layer1: Layer1;
}

struct Layer1 {
    layer2: Layer2;
}

struct Layer2 {
    layer3: Layer3;
}

struct Layer3 {
    val1: Int;
    val2: Int;
}

contract MultiLayerTest {
    c: ComplexNested;

    init() {
        self.c = ComplexNested{
            layer1: Layer1{
                layer2: Layer2{
                    layer3: Layer3{ val1: 42, val2: 24 }
                }
            }
        };
    }
}
