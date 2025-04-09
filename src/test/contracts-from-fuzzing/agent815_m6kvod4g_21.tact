struct S1 {
    foo: Int;
}

struct S2 {
    bar: Int;
    nested: S1;
}

contract NestedOptionalField {
    val: S2?;
    
    init() {
        self.val = S2{
            bar: 1,
            nested: S1{foo:2}
        };
    }
}