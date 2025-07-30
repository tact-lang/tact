// Nested struct with many optional fields and nested
struct SDeep {
    foo: Int?;
    bar: String?;
    score: Int;
}

struct SOuter {
    label: String;
    inner: SDeep?;
}

contract ComplexOptionNest {
    state: SOuter;

    init() {
        self.state = SOuter{
            label: "lbl",
            inner: SDeep{
                foo: null,
                bar: "hi",
                score: 55
            }
        };
    }
}