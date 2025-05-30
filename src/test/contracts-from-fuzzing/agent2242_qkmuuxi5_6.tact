struct DeepChild {
    val: Int;
}

struct MiddleChild {
    nested: DeepChild;
}

struct TopStruct {
    nest: MiddleChild;
}

contract MultiNest {
    data: TopStruct;

    init() {
        self.data = TopStruct{ nest: MiddleChild{ nested: DeepChild{ val: 123 } } };
    }
}