struct InnerOpt {
    inner: Int?;
}

struct Layer2 {
    layer1: InnerOpt;
}

contract NestedOptionalInner {
    data: Layer2;

    init() {
        self.data = Layer2{ layer1: InnerOpt{ inner: null } };
    }
}