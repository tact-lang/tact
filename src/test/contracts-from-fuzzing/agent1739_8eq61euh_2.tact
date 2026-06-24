struct OptionalsNest {
    inner: Int?;
    flag: Bool;
}

contract Test {
    nested: OptionalsNest;

    init() {
        self.nested = OptionalsNest{
            inner: null,
            flag: false
        };
    }
}
