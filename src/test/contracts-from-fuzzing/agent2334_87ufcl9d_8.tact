struct DeeplyNested {
    inner: String;
}

struct Wrap4 {
    w4: DeeplyNested;
}

struct Wrap3 {
    w3: Wrap4;
}

struct Wrap2 {
    w2: Wrap3;
}

struct Wrap1 {
    w1: Wrap2;
}

contract UltraDeep {
    meta: Wrap1;

    init() {
        self.meta = Wrap1{
            w1: Wrap2{
                w2: Wrap3{
                    w3: Wrap4{
                        w4: DeeplyNested{
                            inner: "nested"
                        }
                    }
                }
            }
        };
    }
}