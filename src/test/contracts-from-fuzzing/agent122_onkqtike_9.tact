struct NestedOption {
    foo: Int?;
}

struct OuterOpt {
    bar: NestedOption?;
}

contract OptNestTest {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ bar: null };
    }
}
