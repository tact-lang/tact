struct X {
    foo: Int;
    bar: Bool;
    baz: String?;
}

struct Y {
    q: X?;
    z: Int?;
}

contract DeepMix {
    data: Y;
    init() {
        self.data = Y{ q: null, z: null };
    }
}
