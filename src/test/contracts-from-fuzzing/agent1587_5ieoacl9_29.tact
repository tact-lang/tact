struct InnerMost {
    flag: Bool;
    innerString: String?;
}

struct Inner {
    innerMost: InnerMost?;
}

struct Outer {
    inner: Inner?;
}

contract VeryDeepOpt {
    storage: Outer;

    init() {
        self.storage = Outer{inner:null};
    }
}