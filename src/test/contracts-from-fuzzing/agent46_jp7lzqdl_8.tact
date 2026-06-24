struct InnerOptional {
    a: Int?;
    b: Bool?;
}

struct OuterOptional {
    inner: InnerOptional?;
    flag: Bool;
}

contract OptionalNesting {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            inner: null,
            flag: false,
        };
    }
}
