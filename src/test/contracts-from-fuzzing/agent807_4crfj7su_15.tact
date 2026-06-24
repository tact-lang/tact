// test struct with nested optional struct field
struct InnerOpt {
    foo: Int;
    bar: Bool;
}

struct OuterOpt {
    inner: InnerOpt?;
    value: Int;
}

contract OptionalStructs {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null,
            value: 7,
        };
    }
}