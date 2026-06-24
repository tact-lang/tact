struct NestedOptionals {
    a: Int?;
    b: Bool?;
}

struct OuterOptionals {
    inner: NestedOptionals?;
}

contract OptStructWrap {
    data: OuterOptionals;

    init() {
        self.data = OuterOptionals{ inner: null };
    }
}