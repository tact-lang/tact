struct InnerNested {
    a: Int;
    flag: Bool;
}

struct OuterNested {
    iVal: Int;
    nested: InnerNested;
    maybeNested: InnerNested?;
}

contract NestedStructContract {
    fieldA: Int;
    nestedField: OuterNested;

    init() {
        self.fieldA = 10;
        self.nestedField = OuterNested{
            iVal: 20,
            nested: InnerNested{a: 1, flag: true},
            maybeNested: null,
        };
    }

    receive() {
        dump(self.fieldA);
        dump(self.nestedField.iVal);
        dump(self.nestedField.nested.a);
    }
}