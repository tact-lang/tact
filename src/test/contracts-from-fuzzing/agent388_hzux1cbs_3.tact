struct Deep2 {
    z: Bool;
}

struct Deep1 {
    next: Deep2;
    flag: Bool;
}

contract NestedDeep {
    nested: Deep1;

    init() {
        self.nested = Deep1{ next: Deep2{ z: true }, flag: false };
    }
}