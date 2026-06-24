struct OptionalNested {
    x: Int;
    nested: InnerOptional?;
}

struct InnerOptional {
    y: Int?;
    z: Bool;
}

contract NestedOptionals {
    val: OptionalNested;
    init() {
        self.val = OptionalNested{
            x: 1,
            nested: InnerOptional{
                y: null,
                z: true
            }
        };
    }
}
