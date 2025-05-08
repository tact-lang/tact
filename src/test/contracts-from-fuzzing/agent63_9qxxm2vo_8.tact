struct Bottom {
    x: Int?;
}

struct Middle {
    nested: Bottom?;
}

contract OptionalLayers {
    val: Middle;

    init() {
        self.val = Middle{
            nested: null
        };
    }
}