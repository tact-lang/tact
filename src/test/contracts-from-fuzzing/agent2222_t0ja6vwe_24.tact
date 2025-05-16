struct LevelDeep {
    foo: Int;
}

struct L4 {
    ld: LevelDeep;
}

struct L3 {
    l4: L4;
}

struct L2 {
    l3: L3;
}

contract TestContract {
    inner: L2;
    init() {
        self.inner = L2{ l3:L3{ l4:L4{ ld:LevelDeep{ foo:123 } } } };
    }
}