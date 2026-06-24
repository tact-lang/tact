struct DeepNest {
    inner: MidNest;
}

struct MidNest {
    leaf: LeafNest;
}

struct LeafNest {
    stringVal: String;
    boolVal: Bool;
}

contract DeepTest {
    d: DeepNest;

    init() {
        self.d = DeepNest{
            inner: MidNest{
                leaf: LeafNest{
                    stringVal: "x",
                    boolVal: true,
                }
            }
        };
    }
}