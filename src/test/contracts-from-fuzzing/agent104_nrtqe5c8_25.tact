struct SInner {
    z: Int?;
}

struct SMid {
    x: Int;
    y: SInner?;
}

contract OptionalMidInner {
    m: SMid;
    init() {
        self.m = SMid{
            x: 8,
            y: null
        };
    }
}