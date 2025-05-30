struct InnerMost {
    x: Int;
}

struct InnerMid {
    inner: InnerMost;
}

struct InnerOuter {
    innerMid: InnerMid;
}

contract DeepEmbed {
    payload: InnerOuter;

    init() {
        self.payload = InnerOuter{
            innerMid: InnerMid{
                inner: InnerMost{
                    x: 123
                }
            }
        };
    }
}