struct OptionInner {
    foo: Int?;
}

struct OptionMid {
    inner: OptionInner?;
}

contract OptionNested {
    val: OptionMid;

    init() {
        self.val = OptionMid{inner: OptionInner{foo: 42}};
    }
}