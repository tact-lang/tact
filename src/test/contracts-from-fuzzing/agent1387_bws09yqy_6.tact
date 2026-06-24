struct InnerMost { z: Bool?; num: Int; }

struct Inner {
    a: Int;
    b: Bool;
    im: InnerMost;
}

contract DeepNestOpt {
    persist: Inner;

    init() {
        self.persist = Inner{
            a: 42,
            b: false,
            im: InnerMost{ z: null, num: 999 },
        };
    }
}