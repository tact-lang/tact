struct StructWithManyOptionalLevels {
    layer1: Layer1?;
}

struct Layer1 {
    layer2: Layer2?;
}

struct Layer2 {
    layer3: Layer3?;
}

struct Layer3 {
    value: Int?;
}

contract OptionalLevels {
    data: StructWithManyOptionalLevels;
    init() {
        self.data = StructWithManyOptionalLevels{
            layer1: Layer1{
                layer2: Layer2{
                    layer3: Layer3{
                        value: 42
                    }
                }
            }
        };
    }
}
