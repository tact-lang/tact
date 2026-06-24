struct NestedOptionalIntBool {
    foo: Int?;
    bar: Bool?;
}

contract OptionalsNestedAgain {
    s: NestedOptionalIntBool;

    init() {
        self.s = NestedOptionalIntBool{
            foo: null,
            bar: false,
        };
    }
}