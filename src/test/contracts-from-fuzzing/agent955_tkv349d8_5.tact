struct NestedWithOptional {
    a: Int?;
    inner: InnerLayer;
}

struct InnerLayer {
    flag: Bool?;
    leaf: LeafLayer?;
}

struct LeafLayer {
    name: String?;
}

contract OptionalNestedTest {
    data: NestedWithOptional;

    init() {
        self.data = NestedWithOptional{
            a: null,
            inner: InnerLayer{
                flag: null,
                leaf: null,
            },
        };
    }
}