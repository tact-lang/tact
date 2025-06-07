struct MultiDepth {
    a: Int;
    b: String;
}

struct Wrap1 {
    m: MultiDepth;
}

struct Wrap2 {
    w1: Wrap1;
}

struct Wrap3 {
    w2: Wrap2;
}

contract DeepWrap {
    deep: Wrap3;

    init() {
        self.deep = Wrap3{
            w2: Wrap2{
                w1: Wrap1{
                    m: MultiDepth{
                        a: 7,
                        b: "deepest",
                    }
                }
            }
        };
    }
}