struct NestedWithOptional {
    inner: OptionalInner;
}

struct OptionalInner {
    insideValue: Int?;
}

contract OptionDeep {
    d: NestedWithOptional;

    init() {
        self.d = NestedWithOptional{
            inner: OptionalInner{
                insideValue: null
            }
        };
    }
}