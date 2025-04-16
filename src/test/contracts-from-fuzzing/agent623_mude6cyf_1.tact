struct Nested {
    x: Int;
    y: Int?;
}

contract PersistTest {
    data: Nested;
    flag: Bool = true;
    
    init() {
        self.data = Nested{ x: 1, y: null };
    }
}