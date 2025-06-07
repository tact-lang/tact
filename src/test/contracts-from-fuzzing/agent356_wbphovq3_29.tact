struct SubNested {
    flag: Bool;
}

struct NestedLayer {
    inner: SubNested;
}

contract QuickNest {
    layer: NestedLayer;

    init() {
        self.layer = NestedLayer{
            inner: SubNested{
                flag: false
            }
        };
    }
}