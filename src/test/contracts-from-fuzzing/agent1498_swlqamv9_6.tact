struct SubWithDefaults {
    flag: Bool = false;
    num: Int?;
}

struct WrapSub {
    s: SubWithDefaults;
    val: Int = 10;
}

contract NestedDefaults {
    nested: WrapSub;

    init() {
        self.nested = WrapSub{
            s: SubWithDefaults{},
            val: 20,
        };
    }
}