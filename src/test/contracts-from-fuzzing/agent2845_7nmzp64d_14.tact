struct OptionalNestLevel2 {
    val: Int?;
}

struct OptionalNestLevel1 {
    nested: OptionalNestLevel2?;
}

contract OptionalNestedOptionals {
    foo: OptionalNestLevel1;

    init() {
        self.foo = OptionalNestLevel1{
            nested: null
        };
    }
}