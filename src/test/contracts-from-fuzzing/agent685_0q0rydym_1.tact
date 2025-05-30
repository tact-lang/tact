struct Nested {
    x: Int;
    y: Int?;
}

contract DeepPersistentTest {
    nestedField: Nested;
    
    init() {
        self.nestedField = Nested{
            x: 123,
            y: null,
        };
    }
}