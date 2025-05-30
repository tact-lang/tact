struct MixNestedOptDefault {
    a: Int? = null;
    b: InnerMix?
}

struct InnerMix {
    v: Bool = false;
}

contract MixNestedOptDefaultTest {
    s: MixNestedOptDefault;
    init() {
        self.s = MixNestedOptDefault { b: null };
    }
}