struct OptionalNestedDeep {
    foo: Int?;
    nested: NestedStruct?;
}

struct NestedStruct {
    bar: Int;
}

contract OptionalDeep {
    val: OptionalNestedDeep;

    init() {
        self.val = OptionalNestedDeep{
            foo: null,
            nested: NestedStruct{ bar: 99 }
        };
    }
}