struct Nested {
    field1: Int;
    field2: Bool;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{ field1: 10, field2: true };
    }
}