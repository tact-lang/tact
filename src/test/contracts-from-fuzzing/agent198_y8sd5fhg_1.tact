struct Nested {
    field: Int;
}

contract DeepTest {
    top: Nested;
    
    init() {
        self.top = Nested{field: 10};
    }
}
