struct Deep3 {
    z: Int;
}

struct Deep2 {
    d3: Deep3;
}

struct Deep1 {
    d2: Deep2;
}

contract DeepNested {
    val: Deep1;

    init() {
        self.val = Deep1{ d2: Deep2{ d3: Deep3{ z: 7 } } };
    }
}