struct NestedDefaults {
    innerVal: Int = 5;
    flag: Bool = false;
    txt: String = "abc";
}

struct Wrap {
    content: NestedDefaults = NestedDefaults{};
    otherVal: Int = 42;
}

contract DefaultedComplex {
    wrap: Wrap;

    init() {
        self.wrap = Wrap{};
    }
}