struct SubInner {
    xi: Int;
    yi: Bool?;
}

struct Inner {
    a: Int;
    b: SubInner?;
}

contract NestedStructs {
    store: Inner = Inner{
        a: 1,
        b: SubInner{
            xi: 10,
            yi: null,
        },
    };

    init() {
        self.store = self.store;
    }
}