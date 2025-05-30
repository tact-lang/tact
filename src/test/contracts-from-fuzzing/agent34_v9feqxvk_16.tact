struct NestedOptionalInt {
    val: Int?;
}

struct NestedOptionalOuter {
    nested: NestedOptionalInt?;
}

contract NestedOptOuter {
    data: NestedOptionalOuter;

    init() {
        self.data = NestedOptionalOuter{
            nested: NestedOptionalInt{ val: null }
        };
    }
}