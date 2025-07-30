struct HasInnerOption {
    foo: Int?;
    bar: String?;
}

struct WrapsInner {
    el: HasInnerOption?;
    count: Int;
}

contract NestedNullableMiddle {
    data: WrapsInner;

    init() {
        self.data = WrapsInner{
            el: HasInnerOption{foo: null, bar: "hi"},
            count: 3,
        };
    }
}
