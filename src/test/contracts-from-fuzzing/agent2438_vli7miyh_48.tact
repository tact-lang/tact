struct NestedRem {
    pre: Int;
    r: Slice as remaining;
}

struct ContainerWithRem {
    nested: NestedRem;
}

contract NestedRemaining {
    f: ContainerWithRem;

    init() {
        self.f = ContainerWithRem{ nested: NestedRem{ pre:1,r: emptyCell().asSlice() } };
    }
}
