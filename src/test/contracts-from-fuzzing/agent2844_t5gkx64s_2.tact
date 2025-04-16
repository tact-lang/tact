struct Nested1 {
    x: Int;
    y: Bool;
}

contract TestContract {
    n: Nested1;

    init() {
        self.n = Nested1{
            x: 42,
            y: true,
        };
    }
}
