struct Top {
    inner: Middle;
}

struct Middle {
    inner: Bottom;
}

struct Bottom {
    value: Int;
}

contract ThreeLayerStruct {
    nested: Top;

    init() {
        self.nested = Top{inner: Middle{inner: Bottom{value: 77}}};
    }
}
