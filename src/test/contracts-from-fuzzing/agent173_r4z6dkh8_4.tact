struct Deep3 {
    val: Int;
}

struct Deep2 {
    next: Deep3;
}

struct Deep1 {
    next: Deep2;
}

contract NestedDeep {
    s: Deep1;

    init() {
        self.s = Deep1{ next: Deep2{ next: Deep3{ val: 999 } } };
    }
}