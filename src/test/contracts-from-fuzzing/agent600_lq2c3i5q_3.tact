struct DeepNested {
    value: Int;
}

struct Middle {
    nested: DeepNested;
}

struct Top {
    mid: Middle;
}

contract DeepContract {
    data: Top;

    init() {
        self.data = Top{mid: Middle{nested: DeepNested{value: 123}}};
    }
}