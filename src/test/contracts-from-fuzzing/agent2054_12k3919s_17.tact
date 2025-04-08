struct ComboNest {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

struct OptionalNested {
    nested: ComboNest?;
}

contract OptCombo {
    data: OptionalNested = OptionalNested{ nested: null };
}