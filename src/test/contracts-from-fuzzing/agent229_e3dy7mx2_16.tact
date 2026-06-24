// deeply nested optional in struct
struct Innermost {
    x: Int?;
}

struct Layer1 {
    innermost: Innermost?;
}

struct Layer2 {
    layer1: Layer1?;
}

struct Layer3 {
    layer2: Layer2?;
}

contract OptionalDeeplyNested {
    nestedOpt: Layer3;
    
    init() {
        self.nestedOpt = Layer3{
            layer2: Layer2{
                layer1: Layer1{
                    innermost: Innermost{
                        x: 777
                    }
                }
            }
        };
    }
}