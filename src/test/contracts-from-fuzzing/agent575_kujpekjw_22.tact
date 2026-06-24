struct InnerMix {
    v: Int?;
    f: Bool = false;
}

struct OuterMix {
    inner: InnerMix;
    s: String?;
}

contract MixedDefault {
    val: OuterMix;

    init() {
        self.val = OuterMix{
            inner: InnerMix{ v: null },
            s: null
        };
    }
}