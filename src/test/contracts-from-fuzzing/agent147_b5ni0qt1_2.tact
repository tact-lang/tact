struct InnerMost {
    s: String;
    opt: Int?;
}

struct Middle {
    fst: Int;
    snd: Bool?;
    inner: InnerMost;
}

contract NestedStructStorage {
    field: Middle;
    init() {
        self.field = Middle{
            fst: 7,
            snd: true,
            inner: InnerMost{
                s: "abc",
                opt: null,
            },
        };
    }
}