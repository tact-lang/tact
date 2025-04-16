struct DeepNested {
    leaf1: Int;
    leaf2: Bool;
}

struct Inner {
    nested1: DeepNested;
    nested2: Int?;
}

contract StorageTest {
    data: Inner;

    init() {
        self.data = Inner{
            nested1: DeepNested{leaf1: 1, leaf2: true},
            nested2: null,
        };
    }
}