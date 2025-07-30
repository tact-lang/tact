struct OptionalContainer {
    nested: OptionalInner?;
}

struct OptionalInner {
    a: Int;
    b: Bool;
}

contract NestedOptionalContainer {
    data: OptionalContainer;

    init() {
        self.data = OptionalContainer{
            nested: OptionalInner{
                a: 99,
                b: false
            }
        };
    }
}