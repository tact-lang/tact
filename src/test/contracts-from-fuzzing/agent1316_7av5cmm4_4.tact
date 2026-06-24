struct Deep3 {
    value3: Int;
}

struct Deep2 {
    value2: Deep3;
}

struct Deep1 {
    value1: Deep2;
}

contract Test {
    nested: Deep1 = Deep1{value1: Deep2{value2: Deep3{value3: 42}}};

    init() {
        self.nested = Deep1{value1: Deep2{value2: Deep3{value3: 100}}};
    }
}
