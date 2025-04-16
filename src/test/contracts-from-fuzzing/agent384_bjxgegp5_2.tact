struct DeepNested {
    layer1: Layer1;
}

struct Layer1 {
    layer2: Layer2;
}

struct Layer2 {
    layer3: Layer3;
}

struct Layer3 {
    flag: Bool;
    num: Int;
}

contract TestContract {
    data: DeepNested = DeepNested{
        layer1: Layer1{
            layer2: Layer2{
                layer3: Layer3{
                    flag: false,
                    num: 0
                }
            }
        }
    };

    init() {
        self.data.layer1.layer2.layer3.flag = true;
        self.data.layer1.layer2.layer3.num = 99;
    }
}
