struct Deep3 {
    x: Int;
}

struct Deep2 {
    nested: Deep3;
}

struct Deep1 {
    nested: Deep2;
}

contract DeepNestedStructs {
    s: Deep1;

    init() {
        self.s = Deep1{nested: Deep2{nested: Deep3{x: 7}}};
    }
}
