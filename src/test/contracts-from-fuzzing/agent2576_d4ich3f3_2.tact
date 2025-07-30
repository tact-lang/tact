struct InnerNested {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedStructField {
    nested: InnerNested;

    init() {
        self.nested = InnerNested{a:1, b:true, c:"hi"};
    }
}