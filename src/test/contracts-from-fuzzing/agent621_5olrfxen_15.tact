struct DeepMix {
    req: Int;
    opt1: Int?;
    inner: Inner?;
}

struct Inner {
    foo: Int;
    bar: Bool?;
}

contract DeepMixing {
    val: DeepMix;
    init() {
        self.val = DeepMix{
            req: 10,
            opt1: null,
            inner: Inner{ foo: 20, bar: null }
        };
    }
}