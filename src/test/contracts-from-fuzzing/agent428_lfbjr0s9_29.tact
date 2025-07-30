struct InnerOptional {
    a: Int as uint8;
    b: String?;
}

struct OuterOptional {
    inner: InnerOptional?;
    tag: Int as uint4;
}

contract TestContract {
    nested: OuterOptional?;

    init() {
        self.nested = null;
    }
}