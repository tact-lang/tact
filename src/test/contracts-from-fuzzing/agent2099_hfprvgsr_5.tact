struct OptionalsNested {
    foo: Int?;
    bar: String?;
    nested: Inner?;
}

struct Inner {
    val: Int?;
}

contract OptionalsInStructContract {
    s: OptionalsNested;

    init() {
        self.s = OptionalsNested{
            foo: null,
            bar: null,
            nested: null
        };
    }
}