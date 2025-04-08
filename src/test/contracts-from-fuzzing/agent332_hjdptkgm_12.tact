struct InnerMost { val: Bool; }

struct InnerMid { inner1: InnerMost; inner2: InnerMost; }

struct Outer {
    mid: InnerMid;
    optStr: String?;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            mid: InnerMid{
                inner1: InnerMost{val: true},
                inner2: InnerMost{val: false}
            },
            optStr: null
        };
    }
}