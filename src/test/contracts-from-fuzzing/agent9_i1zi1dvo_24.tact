struct SuperDeep {
    lvl4: Int;
}
struct Deep3 {
    s: SuperDeep;
}
struct Deep2 {
    d: Deep3;
}
struct Deep1 {
    d: Deep2;
}

contract UltraDeepNested {
    field: Deep1;

    init() {
        self.field = Deep1{ d: Deep2{ d: Deep3{ s: SuperDeep{ lvl4: 42 } } } };
    }
}