struct NestedDeep {
    inner1: Int;
    inner2: Int?;
}

struct OuterDeep {
    sub: NestedDeep;
    outerVal: Int?;
}

contract TestDeep {
    val: OuterDeep;

    init() {
        self.val = OuterDeep{
            sub: NestedDeep{ inner1: 1, inner2: null },
            outerVal: 2
        };
    }
}
