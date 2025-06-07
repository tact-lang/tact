struct NestedOptChain {
    deep: Middle?;
}

struct Middle {
    more: Inner?;
}

struct Inner {
    foo: Int;
}

contract ChainOpt {
    field: NestedOptChain = NestedOptChain{ deep: null };

    init() {
        self.field = NestedOptChain{
            deep: Middle{
                more: Inner{ foo: 77 }
            }
        };
    }
}