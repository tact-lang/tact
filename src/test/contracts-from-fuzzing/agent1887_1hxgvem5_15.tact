struct NestedOptionalDeep {
    a: Inner?;
}

struct Inner {
    b: Inner2?;
}

struct Inner2 {
    c: Int;
}

contract NestedOptionalChain {
    storage: NestedOptionalDeep;

    init() {
        self.storage = NestedOptionalDeep{
            a: null,
        };
    }
}