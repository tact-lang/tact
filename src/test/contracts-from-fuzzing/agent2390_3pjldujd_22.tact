struct InnerMost {
    x: Int;
}

struct InnerMid {
    inner: InnerMost;
}

struct InnerTop {
    mid: InnerMid;
}

struct Out {
    top: InnerTop;
}

contract DeepestNest {
    val: Out;
    init() {
        self.val = Out{
            top: InnerTop{
                mid: InnerMid{
                    inner: InnerMost{ x: 99 }
                }
            }
        };
    }
}