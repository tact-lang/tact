struct StrNest {
    s: String;
    b: Bool;
    val: Int;
}

struct TupleOuter {
    a: Int;
    inner: StrNest;
    b: Bool;
}

contract MixNestedFields {
    data: TupleOuter;

    init() {
        self.data = TupleOuter{
            a: 5,
            inner: StrNest{ s: "test", b: false, val: 10 },
            b: true,
        };
    }
}
