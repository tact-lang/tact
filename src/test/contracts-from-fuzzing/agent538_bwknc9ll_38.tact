struct Deep {
    layer1: Int;
    layer2: String;
    optLayer: Int?;
}

struct Deepest {
    nested: Deep;
}

contract NestedWithOptional {
    d: Deepest;

    init() {
        self.d = Deepest{
            nested: Deep{
                layer1: 1,
                layer2: "l2",
                optLayer: null
            }
        };
    }
}