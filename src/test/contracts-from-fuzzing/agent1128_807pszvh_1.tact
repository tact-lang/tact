struct Simple {
    a: Int;
    b: Bool;
}

contract Test {
    x: Simple;

    init() {
        self.x = Simple{ a: 1, b: true };
    }
}