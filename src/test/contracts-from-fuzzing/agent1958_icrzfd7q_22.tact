struct Outer {
    a: Int;
    b: Int;
}

contract TestOrder {
    state: Outer;

    init() {
        self.state = Outer{ b:5, a:3 };
    }
}
