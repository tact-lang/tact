struct DeepNest {
    a: One;
}

struct One {
    b: Two;
}

struct Two {
    c: Three;
}

struct Three {
    d: Four;
}

struct Four {
    e: Int;
}

contract Chain {
    deep: DeepNest;

    init() {
        self.deep = DeepNest{
            a: One{
                b: Two{
                    c: Three{
                        d: Four{
                            e: 42
                        }
                    }
                }
            }
        };
    }
}