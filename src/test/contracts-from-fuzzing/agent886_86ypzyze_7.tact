struct DeeplyNested {
    inner1: Int;
    inner2: Int;
}

struct LayerTwo {
    nested1: DeeplyNested;
    nested2: DeeplyNested;
}

struct LayerThree {
    layerTwoVal: LayerTwo;
}

contract TestContract {
    core: LayerThree;
    init() {
        self.core = LayerThree{
            layerTwoVal: LayerTwo{
                nested1: DeeplyNested{inner1:1, inner2:2},
                nested2: DeeplyNested{inner1:3, inner2:4}
            }
        };
    }
}
