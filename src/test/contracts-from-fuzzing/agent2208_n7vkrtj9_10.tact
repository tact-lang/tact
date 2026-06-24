struct DeeplyNested {
    inner1: Int;
    inner2: Int;
    inner3: Int;
}

struct Layer2 {
    nested1: DeeplyNested;
    nested2: DeeplyNested;
}

struct Layer1 {
    layer2_a: Layer2;
    layer2_b: Layer2;
}

contract FatTree {
    storage: Layer1;

    init() {
        self.storage = Layer1{
            layer2_a: Layer2{
                nested1: DeeplyNested{inner1:1, inner2:2, inner3:3},
                nested2: DeeplyNested{inner1:4, inner2:5, inner3:6}
            },
            layer2_b: Layer2{
                nested1: DeeplyNested{inner1:7, inner2:8, inner3:9},
                nested2: DeeplyNested{inner1:10, inner2:11, inner3:12}
            }
        };
    }
}