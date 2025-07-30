struct OptionalNested {
    foo: Int?; 
    bar: Bool?;
}

contract OptNestedField {
    obj: OptionalNested;

    init() {
        self.obj = OptionalNested{ foo: null, bar: null };
    }
}
