struct Nested {
    b: Bool;
    n: Int;
}

contract DeepPersistentTest {
    s: Nested;
    
    init() {
        self.s = Nested{ b: true, n: 123 };
    }
}