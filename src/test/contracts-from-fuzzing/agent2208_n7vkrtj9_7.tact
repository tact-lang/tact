struct InnerMost {
    deepVal: Int;
}

struct Middle {
    inner: InnerMost;
    flag: Bool;
}

struct Top {
    middle: Middle;
    optionalStr: String?;
}

contract NestedOptStructs {
    storage: Top?;

    init() {
        self.storage = null;
    }
}