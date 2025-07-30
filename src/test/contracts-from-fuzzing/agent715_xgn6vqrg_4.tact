struct OptionalDeep {
    inner: OptionalInner?;
}

struct OptionalInner {
    flag: Bool;
    nestedOpt: NestedInner?;
}

struct NestedInner {
    val: Int;
}

contract TestContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            inner: OptionalInner{
                flag: true,
                nestedOpt: NestedInner{ val: 99 }
            }
        };
    }
}