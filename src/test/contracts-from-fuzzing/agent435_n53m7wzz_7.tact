struct NestedMore {
    a: Int;
    b: Bool?;
    c: String;
    d: Slice?;
}

struct OuterMore {
    nested1: NestedMore?;
    nested2: NestedMore?;
}

contract OptionInOption {
    om: OuterMore;

    init() {
        self.om = OuterMore{
            nested1: null,
            nested2: null
        };
    }
}