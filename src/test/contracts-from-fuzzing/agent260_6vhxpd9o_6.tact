struct InnerOpt {
    foo: Int?;
    bar: String;
}

struct OuterOpt {
    val: Int;
    inner: InnerOpt;
}

contract OptionalNested {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ val: 7, inner: InnerOpt{ foo: null, bar: "x" } };
    }
}