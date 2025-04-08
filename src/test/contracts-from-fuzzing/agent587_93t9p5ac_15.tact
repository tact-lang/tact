struct DeepOptMix {
    inner: MaybeInner?;
}

struct MaybeInner {
    a: Int?;
    b: Bool?;
    c: Int;
}

contract DeepOptMixContract {
    data: DeepOptMix;

    init() {
        self.data = DeepOptMix{
            inner: null
        };
    }
}
