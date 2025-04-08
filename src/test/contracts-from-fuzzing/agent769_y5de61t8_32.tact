struct BigNested {
    first: Int;
    second: Int;
    third: Int;
    nested: Nested;
}

struct Nested {
    deep1: Int;
    deep2: Int;
    deepest: Inner;
}

struct Inner {
    val: Int;
}

contract NestedLots {
    x: BigNested;
    init() {
        self.x = BigNested{
            first:1, second:2, third:3,
            nested: Nested{
                deep1:4, deep2:5, deepest: Inner{ val: 6 }
            }
        };
    }
}