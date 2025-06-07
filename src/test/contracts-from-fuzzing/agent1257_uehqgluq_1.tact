struct Nested {
    x: Int = 10;
    y: Bool = true;
}

contract Test {
    val: Nested = Nested{};
    
    init() {
        self.val = Nested{ x: 42, y: false };
    }
}
