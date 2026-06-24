struct NestedOption {
    inner: Int?;
    flag: Bool;
}

contract OptionInStruct {
    f: NestedOption;

    init() {
        self.f = NestedOption{
            inner: 555,
            flag: true
        };
    }
}