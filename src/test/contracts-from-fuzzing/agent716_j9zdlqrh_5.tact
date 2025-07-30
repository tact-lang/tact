struct OptionalNested {
    inner: Int?;
}

struct OptionalOuter {
    innerStruct: OptionalNested?;
}

contract OptionalChain {
    storage: OptionalOuter?;

    init() {
        self.storage = null;
    }
}