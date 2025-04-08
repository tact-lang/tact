struct OptionDeep {
    inner: OptionInner?;
}

struct OptionInner {
    val: Int;
}

contract TestContract {
    st: OptionDeep;

    init() {
        self.st = OptionDeep{ inner: null };
    }
}