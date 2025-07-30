struct Deep {
    val: Int;
}

struct Layer3 {
    deep: Deep;
    optionalDeep: Deep?;
}

struct Layer2 {
    layer3: Layer3;
    optionalLayer3: Layer3?;
}

struct Layer1 {
    layer2: Layer2;
    optionalLayer2: Layer2?;
}

contract TestDeepNested {
    data: Layer1;

    init() {
        self.data = Layer1{
            layer2: Layer2{
                layer3: Layer3{
                    deep: Deep{ val: 7 },
                    optionalDeep: null
                },
                optionalLayer3: null
            },
            optionalLayer2: null
        };
    }
}