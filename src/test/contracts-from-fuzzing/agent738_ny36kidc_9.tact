struct Simple {
    a: Int;
    b: Bool;
}

contract MultiUsePersistent {
    one: Simple;
    two: Simple?;

    init() {
        self.one = Simple{ a: 7, b: true };
        self.two = null;
    }
}