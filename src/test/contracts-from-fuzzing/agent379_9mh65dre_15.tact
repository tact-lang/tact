struct DeepLeaf {
    flag: Bool?;
    notes: String?;
    value: Int?;
}

struct Container {
    leaf: DeepLeaf?;
    count: Int;
}

contract OptNestedLeaf {
    data: Container;

    init() {
        self.data = Container{
            leaf: null,
            count: 100,
        };
    }
}