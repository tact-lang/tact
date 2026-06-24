struct Layer1 {
    first: Int;
    layer2: Layer2;
}

struct Layer2 {
    second: Int;
    layer3: Layer3;
}

struct Layer3 {
    third: Int;
    maybeBool: Bool?;
}

contract DeepChain {
    root: Layer1;

    init() {
        self.root = Layer1{
            first:1,
            layer2: Layer2{
                second:2,
                layer3: Layer3{
                    third:3,
                    maybeBool:null
                }
            }
        };
    }
}