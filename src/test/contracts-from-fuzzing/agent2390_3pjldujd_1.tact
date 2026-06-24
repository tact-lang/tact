struct Nested {
    val1: Int;
    val2: Bool;
}

contract DeepNestedTest {
    data: Nested;
    
    init() {
        self.data = Nested{ val1: 42, val2: true };
    }
}