struct MultipleLevels {
    layer1: Layer1;
}

struct Layer1 {
    layer2: Layer2;
}

struct Layer2 {
    layer3: Layer3;
}

struct Layer3 {
    value: Int;
}

contract TestContract {
    deep: MultipleLevels;

    init() {
        self.deep = MultipleLevels{
            layer1: Layer1{
                layer2: Layer2{
                    layer3: Layer3{
                        value: 777,
                    },
                },
            },
        };
    }
}