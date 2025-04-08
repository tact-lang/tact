struct StrInner {
    s: String;
}

contract OptNullableStr {
    opt: StrInner? = null;
    init() {}
}