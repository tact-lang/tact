struct OptInner {
    v: Int;
}

struct OptOuter {
    inner: OptInner?;
}

contract OptionalDeep {
    data: OptOuter = OptOuter{inner: OptInner{v: 42}};
}