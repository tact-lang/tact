struct Nested {
    inner1: Int;
    inner2: Bool;
}

contract SingleNested {
    nestedField: Nested;
    
    init() {
        self.nestedField = Nested{ inner1: 5, inner2: true };
    }
}