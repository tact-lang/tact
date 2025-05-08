struct MidOptDef {
    foo: Int? = null;
    bar: Bool = true;
}

struct OuterHasInner {
    mid: MidOptDef;
    x: Int;
}

contract NestedDefaultsTest {
    val: OuterHasInner;

    init() {
        self.val = OuterHasInner{
            mid: MidOptDef{},
            x: 11
        };
    }
}