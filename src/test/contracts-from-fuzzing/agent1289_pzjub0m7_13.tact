struct InnerMix {
    x: Int as uint8 = 5;
    y: Int as int16 = -10;
}

struct OuterMix {
    i: InnerMix;
    flag: Bool = true;
}

contract AnnotatedDefaultsTest {
    storage: OuterMix;

    init() {
        self.storage = OuterMix{
            i: InnerMix{},
            // omit flag, use default
        };
    }
}