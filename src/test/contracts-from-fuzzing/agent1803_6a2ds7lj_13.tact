struct Simple {
    a: Int;
    b: Bool;
}

contract ComplexStorage {
    field1: Simple;
    field2: Simple;
    field3: Simple;
    
    init() {
        self.field1 = Simple { a: 1, b: true };
        self.field2 = Simple { a: 2, b: false };
        self.field3 = Simple { a: 3, b: true };
    }
}