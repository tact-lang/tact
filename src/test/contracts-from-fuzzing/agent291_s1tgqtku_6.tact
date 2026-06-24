struct OptWrap {
    wrapped: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalStructField {
    s: OptWrap;

    init() {
        self.s = OptWrap{
            wrapped: null,
        };
    }
}