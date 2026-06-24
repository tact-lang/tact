struct VeryDeep {
    n1: Nested;
    flag: Bool;
}

struct Nested {
    sub: Inner;
}

struct Inner {
    val: Int;
}

contract DeepNestTest {
    s: VeryDeep;

    init() {
        self.s = VeryDeep{
            n1: Nested{
                sub: Inner{val: 42}
            },
            flag: true,
        };
    }
}
