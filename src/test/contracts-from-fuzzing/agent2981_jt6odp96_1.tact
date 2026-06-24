struct Nested {
    x: Int;
    y: Int?;
}

contract DeepNestedTest {
    point: Nested;
    
    init() {
        self.point = Nested{
            x: 42,
            y: null,
        };
    }
}