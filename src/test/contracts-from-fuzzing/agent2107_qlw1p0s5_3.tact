struct Massive {
    v0: Int;
    v1: Int;
    v2: Int;
    v3: Int;
    v4: Int;
    v5: Int;
    v6: Int;
    v7: Int;
    v8: Int;
    v9: Int;
}

contract WideFields {
    field: Massive;

    init() {
        self.field = Massive{
            v0: 1,
            v1: 2,
            v2: 3,
            v3: 4,
            v4: 5,
            v5: 6,
            v6: 7,
            v7: 8,
            v8: 9,
            v9: 10,
        };
    }
}