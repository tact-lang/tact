struct OptionalsOnly {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract TestContract {
    opts: OptionalsOnly;

    init() {
        self.opts = OptionalsOnly{
            foo: null,
            bar: null,
            baz: null
        };
    }
}