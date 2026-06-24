struct Inner {
    b: Bool?;
}

struct Outer {
    s: Inner;
    val: Int?;
}

contract OptionalMix {
    data: Outer;

    init() {
        self.data = Outer{ s: Inner{ b: null }, val: null };
    }
}