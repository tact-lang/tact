struct Inner {
    i1: Int;
    i2: Bool;
}

struct Outer {
    o1: Bool;
    nested: Inner;
    o2: Int?;
}

contract MixedStorage {
    val: Outer;

    init() {
        self.val = Outer{
            o1: true,
            nested: Inner{ i1: 5, i2: false },
            o2: null
        };
    }
}