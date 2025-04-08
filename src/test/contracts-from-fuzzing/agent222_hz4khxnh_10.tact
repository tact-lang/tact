struct DeepOptInner {
    foo: Int?;
}

struct MiddleLayer {
    inner: DeepOptInner;
}

struct TopLayer {
    mid: MiddleLayer;
}

contract DeepNestedOpt {
    val: TopLayer = TopLayer{mid: MiddleLayer{inner: DeepOptInner{foo: null}}};

    receive() {
        self.val = TopLayer{mid: MiddleLayer{inner: DeepOptInner{foo: 123}}};
    }
}