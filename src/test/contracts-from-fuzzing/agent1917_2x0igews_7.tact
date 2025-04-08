struct ExtraNested {
    a: Int;
    b: Bool;
    c: String;
}

struct OuterLevel {
    inner: ExtraNested;
    optionalInner: ExtraNested?;
}

contract OptionalStructField {
    data: OuterLevel;

    init() {
        self.data = OuterLevel{
            inner: ExtraNested{a: 1, b: true, c: "hi"},
            optionalInner: null,
        };
    }
}
