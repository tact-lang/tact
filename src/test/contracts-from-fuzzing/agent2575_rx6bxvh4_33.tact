struct DeepOverride {
    inner: OverrideInner;
}

struct OverrideInner {
    foo: Int = 5;
    bar: Bool = false;
}

contract TestContract {
    val: DeepOverride = DeepOverride{
        inner: OverrideInner{
            foo: 99,
            bar: true
        }
    };
}