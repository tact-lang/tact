struct DeepNested {
    optInner: Inner?;
}

struct Inner {
    value: Int;
}

contract TestContract {
    dn: DeepNested = DeepNested{ optInner: null };
}