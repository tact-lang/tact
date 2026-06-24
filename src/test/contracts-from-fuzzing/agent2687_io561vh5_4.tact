struct DeepNested {
    val: Int;
}

struct MidNested {
    dn: DeepNested;
}

struct TopNested {
    mn: MidNested;
}

contract DeepNestedStorage {
    data: TopNested;

    init() {
        self.data = TopNested{ mn: MidNested{ dn: DeepNested{ val: 42 } } };
    }
}