struct Inner {
    a: Int;
    b: Bool;
}

contract ContractParamsNested(
    inner: Inner,
    val: String?
) {
    get fun test(): Int {
        return self.inner.a;
    }
}