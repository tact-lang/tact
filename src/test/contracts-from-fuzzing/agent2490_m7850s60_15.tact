struct InnerOpt {
    value: Int?;
}

struct Middle {
    inner: InnerOpt?;
}

struct Outer {
    middle: Middle?;
}

contract DeepOptionChain {
    storage: Outer?;

    init() {
        self.storage = null;
    }
}