struct Inner1 { i1: Int; }
struct Inner2 { i2: Int; }
struct Inner3 { i3: Int; }

struct NestedMix {
    f1: Inner1;
    f2: Int;
    f3: Inner2;
    f4: Bool;
    f5: Inner3;
}

contract MixTest {
    store: NestedMix;

    init() {
        self.store = NestedMix{
            f1: Inner1{ i1: 1 },
            f2: 2,
            f3: Inner2{ i2: 3 },
            f4: true,
            f5: Inner3{ i3: 5 }
        };
    }
}