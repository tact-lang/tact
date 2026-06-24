struct DeeplyNested {
    a: Int;
    b: String?;
    c: map<Int, Cell>;
}

struct MidNested {
    d: DeeplyNested;
    e: Bool;
}

struct TopLevel {
    f: MidNested;
    g: Int;
    h: DeeplyNested?;
}

contract DeepNestedContract {
    field: TopLevel;

    init() {
        self.field = TopLevel{
            f: MidNested{
                d: DeeplyNested { a: 1, b: null, c: emptyMap() },
                e: true
            },
            g: 42,
            h: null
        };
    }
}