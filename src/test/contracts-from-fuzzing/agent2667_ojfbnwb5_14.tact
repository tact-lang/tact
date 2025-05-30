struct OptionalStructWithNestedInts {
    a: Int?;
    b: Int;
    c: Int?;
}

contract OptStructNested {
    s: OptionalStructWithNestedInts;
    
    init() {
        self.s = OptionalStructWithNestedInts{a: null, b: 5, c: null};
    }
    
    receive() {
        self.s = OptionalStructWithNestedInts{a: 10, b: 11, c: 12};
    }
}