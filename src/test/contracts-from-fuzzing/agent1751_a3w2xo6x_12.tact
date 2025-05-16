struct NestedPlusDefault {
    nested: NestedInner;
    optInt: Int?;
    flag: Bool = true;
}

struct NestedInner {
    x: Int = 1;
    y: Int = 2;
}

contract NestedDefaultTest {
    s: NestedPlusDefault;

    init() {
        self.s = NestedPlusDefault{
            nested: NestedInner{},
            optInt: null,
            flag: true,
        };
    }
}
