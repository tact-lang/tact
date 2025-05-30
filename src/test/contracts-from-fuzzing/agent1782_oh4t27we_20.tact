struct StructNested {
    a: Int;
    b: Bool;
}

contract NestedWithDefaults {
    foo: Int = 0;
    bar: Bool = false;
    nested: StructNested = StructNested{ a:1, b:true };
}