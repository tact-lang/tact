struct InnerOption {
    foo: Int?;
    bar: Bool?;
}

struct MiddleOption {
    inner: InnerOption?;
    s: String;
}

contract NestedOptionals {
    m: MiddleOption;

    init() {
        self.m = MiddleOption{
            inner: null,
            s: "test"
        };
    }
}