struct SDeep {
    inner: SInner?;
}

struct SInner {
    foo: Int;
    bar: String?;
}

contract ParamDeepOptional(
    deep: SDeep,
) {
    receive() {
        let _ = self.deep.inner;
    }
}