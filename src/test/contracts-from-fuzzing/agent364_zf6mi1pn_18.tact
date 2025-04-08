struct X {
    a: Int;
}

trait T {
    x: X;
}

contract InheritTest with T {
    x: X;

    init() {
        self.x = X{ a: 5 };
    }
}