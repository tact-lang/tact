struct SOptional { inner: Int? }
contract OptionalInStruct {
    s: SOptional;

    init() {
        self.s = SOptional{ inner: null };
    }
}