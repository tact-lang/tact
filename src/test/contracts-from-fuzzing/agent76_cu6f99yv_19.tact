struct NestedStrOpt {
    foo: String?;
}

struct Wrap {
    x: NestedStrOpt;
    y: NestedStrOpt?;
}

contract NestedOptions {
    data: Wrap;
    init() {
        self.data = Wrap {
            x: NestedStrOpt { foo: null },
            y: null
        };
    }
}