struct X {
    a: Int;
    b: Int;
}

contract InitNested {
    y: X;

    init() {
        self.y = X { a: 2, b:3 };
    }
    receive() {}
}