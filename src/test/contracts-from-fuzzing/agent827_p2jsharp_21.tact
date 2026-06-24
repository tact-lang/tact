struct InnerWithHint {
    flag: Bool;
    score: Int as uint32;
}

struct OuterWithInner {
    info: InnerWithHint;
    label: String;
}

contract NestedHintPersist {
    storage: OuterWithInner = OuterWithInner{
        info: InnerWithHint{ flag: true, score: 123 },
        label: "abc"
    };

    receive() {
        self.storage = self.storage;
    }
}