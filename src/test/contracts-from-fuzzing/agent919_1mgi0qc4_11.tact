struct InnerDeep {
    val1: Int;
    opt1: Int?;
}

struct MidDeep {
    inner: InnerDeep;
    opt2: InnerDeep?;
}

contract MixedDeepOptional {
    storage1: MidDeep?;
    storage2: MidDeep;

    init() {
        self.storage1 = null;
        self.storage2 = MidDeep {
            inner: InnerDeep{ val1:5, opt1:null },
            opt2: null
        };
    }
}