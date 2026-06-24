struct InnerVal {
    val: Int;
}

struct OuterOpt {
    inner: InnerVal?;
}

contract OptionInOuter {
    stored: OuterOpt;

    init() {
        self.stored = OuterOpt{
            inner: null
        };
    }
}