struct Nested {
    x: Int = 10;
    y: Bool = false;
}

contract TestContract {
    nested: Nested = Nested{};
    init() {}
    receive() {
        let _ = self.nested.x;
    }
}