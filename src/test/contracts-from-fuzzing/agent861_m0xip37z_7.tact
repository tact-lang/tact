struct Deep3 {
    z: Int;
}

struct Deep2 {
    y: Deep3;
}

struct Deep1 {
    x: Deep2;
}

contract DeepNested {
    data: Deep1;

    init() {
        self.data = Deep1{ x: Deep2{ y: Deep3{ z: 9 } } };
    }
}
