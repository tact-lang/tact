struct Nested {
    x: Int;
    y: Bool = false;
}

contract TestContract {
    n: Nested;

    init() {
        self.n = Nested{
            x: 5
            // missing y, but has default
        };
    }
}