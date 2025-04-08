struct MaybeInner {
    innerVal: Int?;
}

contract OptionalInsideStruct {
    inner: MaybeInner;

    init() {
        self.inner = MaybeInner{ innerVal: null };
    }
}
