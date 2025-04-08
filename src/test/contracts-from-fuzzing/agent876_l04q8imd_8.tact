struct DeepEmbedded {
    a: Int;
    b: Bool;
}

contract NestedInPersistent {
    data1: DeepEmbedded;
    data2: DeepEmbedded;

    init() {
        self.data1 = DeepEmbedded{a: 1, b: true};
        self.data2 = DeepEmbedded{a: 2, b: false};
    }

    receive() {
        dump(self.data1.a + self.data2.a);
    }
}