struct NestedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct MiddleLayer {
    inner: NestedOptionals;
    flag: Bool;
}

contract OptionalNest {
    state: MiddleLayer;

    init() {
        self.state = MiddleLayer{
            inner: NestedOptionals{ a: null, b: null, c: null },
            flag: true
        };
    }
}