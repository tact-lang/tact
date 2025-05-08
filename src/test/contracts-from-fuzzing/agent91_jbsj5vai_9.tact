struct NestedOptional {
    nested: OptionalInner?;
    val: Int;
}

struct OptionalInner {
    x: Int;
    y: Bool;
}

contract NestedOptionalContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            nested: OptionalInner{ x: 10, y: true },
            val: 99
        };
    }
}
