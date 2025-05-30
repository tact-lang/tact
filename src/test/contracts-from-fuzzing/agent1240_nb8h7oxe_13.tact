struct InnerMost {
    z: Int;
}

struct InnerMid {
    m: Int;
    inner: InnerMost;
}

struct InnerTop {
    innerMid: InnerMid;
}

contract MultiNest {
    payload: InnerTop;
    init() {
        self.payload = InnerTop{
            innerMid: InnerMid{
                m: 3,
                inner: InnerMost{ z: 9 }
            }
        };
    }
}