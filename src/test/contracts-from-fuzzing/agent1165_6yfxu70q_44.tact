struct Int8s {
    a: Int as int8;
    b: Int as int8;
    c: Int as int8;
}

contract Int8Packing {
    triple: Int8s;

    init() {
        self.triple = Int8s{ a: 1, b: -2, c: 3 };
    }
}
