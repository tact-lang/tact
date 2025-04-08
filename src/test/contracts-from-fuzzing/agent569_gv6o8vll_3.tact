struct Inner { foo: Int?; bar: Bool; val: String; }

contract OptionalMix {
    inner: Inner;
    init() {
        self.inner = Inner{ foo: null, bar: true, val: "str" };
    }
}