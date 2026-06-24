struct InnerMost {
    a: Int?;
    b: Bool?;
}

struct Inner {
    innerMost1: InnerMost;
    innerMost2: InnerMost?;
}

struct MainStruct {
    x: Int;
    inner: Inner?;
}

contract OptionalsEverywhere {
    val: MainStruct?;

    init() {
        self.val = null;
    }
}
