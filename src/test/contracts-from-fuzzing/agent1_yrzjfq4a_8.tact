struct DeepNest {
    inner: InnerMostDeep;
}

struct InnerMostDeep {
    leaf1: Int;
    leaf2: Int;
    leaf3: Int;
    leaf4: Int;
    leaf5: Int;
}

contract MultiLeafDeep {
    node: DeepNest;

    init() {
        self.node = DeepNest{
            inner: InnerMostDeep{
                leaf1: 1, leaf2:2, leaf3:3, leaf4:4, leaf5:5
            }
        };
    }
}