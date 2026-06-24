struct Inner {
    a: Int?;
    b: Bool;
}

struct OuterOpt {
    nested: Inner?;
    c: String;
}

contract NullableNest {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nested: null,
            c: "cat",
        };
    }
}