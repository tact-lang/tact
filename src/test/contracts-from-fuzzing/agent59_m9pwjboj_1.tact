struct Nested {
    val: Int;
}

contract DeepNested {
    field: Nested;
    
    init() {
        self.field = Nested{ val: 42 };
    }
}