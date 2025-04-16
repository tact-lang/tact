struct NestedOptInner {
    a: Int?;
    b: String?;
}

struct NestedOptOuter {
    x: Int;
    y: NestedOptInner?;
}

contract NestedNullable {
    val: NestedOptOuter?;

    init() {
        self.val = NestedOptOuter{
            x: 27,
            y: null,
        };
    }
}