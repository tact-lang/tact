struct TripleNested {
    a: Int;
}

struct MidNested {
    mid: TripleNested;
}

struct TopNested {
    top: MidNested;
}

contract TestTripleNested {
    field: TopNested;

    init() {
        self.field = TopNested{ top: MidNested{ mid: TripleNested{ a: 123 } } };
    }
}