struct NestedOpt {
    nested: Inner?;
}

struct Inner {
    a: Int;
    b: Bool?;
}

contract NestedOptContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            nested: null
        };
    }
}
