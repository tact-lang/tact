struct DeeplyNested {
    inner1: Int;
    inner2: Int?;
    mapField: map<Int, Int>;
}

struct Container {
    nested1: DeeplyNested;
    nested2: DeeplyNested;
}

contract MultiNested {
    storage: Container;

    init() {
        self.storage = Container{
            nested1: DeeplyNested{ inner1: 1, inner2: null, mapField: emptyMap() },
            nested2: DeeplyNested{ inner1: 2, inner2: null, mapField: emptyMap() }
        };
    }
}