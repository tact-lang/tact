// Carefully nested optionals and default values, with explicit serialization sizes
struct DeepMix {
    a: Int? as uint32;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

struct WrapMix {
    inner: DeepMix?;
    flag: Bool;
}

contract DeepMixContract {
    data: WrapMix;
    init() {
        self.data = WrapMix{
            inner: null,
            flag: true,
        };
    }
}