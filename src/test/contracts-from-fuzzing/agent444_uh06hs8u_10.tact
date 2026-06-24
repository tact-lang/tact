struct InnerMost {
    val: Int;
}

struct MidLevel {
    mid: InnerMost;
}

struct OuterLevel {
    outer: MidLevel;
}

contract VeryDeepNesting {
    data: OuterLevel;

    init() {
        self.data = OuterLevel{ outer: MidLevel{ mid: InnerMost{ val: 42 } } };
    }
}